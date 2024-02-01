import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/Presentation/screens/detail_screen/detail_screen.dart';
import 'package:pet_adoption_app/Presentation/screens/detail_screen/interactive_zoom.dart';
import '../../../Bloc/adoption_bloc.dart';
import '../../../models/pet_model.dart';
import 'widgets/pet_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AdoptionBloc>().add(FetchAdoptionListEvent());
  }

  List<PetModel> _allDetail = [];
  void _search(String enteredKeyWord) {

    List<PetModel>? result = [];
    if (enteredKeyWord.isNotEmpty) {
      result = _allDetail
          .where((pet) =>
              pet.name!.toLowerCase().contains(enteredKeyWord.toLowerCase()))
          .toList();
    }else{
      result = _allDetail;
    }

    context.read<AdoptionBloc>().add(SearchClickedEvent(result));
  }
  bool isDark = false;
  Icon iconValue = const Icon(Icons.light_mode_outlined);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdoptionBloc, AdoptionState>(
  listener: (context, state) {
    switch (state) {
      case AdoptionInitial():
        break;
      case AdoptionLoading():
        break;
      case AdoptionFetched():
        _allDetail = state.store.adoptList!;
      case AdoptionError():
        break;
      case AdoptionCardClickedState():
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const DetailScreen(),
          ),
        );
      case AdoptMeClickedState():
        break;
      case SearchedClickedState():
        break;

      case OnTapZoomState():
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const InteractiveZoom(),
          ),
        );
      case ThemeToggleState():
        iconValue = const Icon(Icons.dark_mode);
    }
  },
  builder: (context, state) {

    return MaterialApp(
      theme: state.store.themeData,
      home: Scaffold(

        appBar: AppBar(
          centerTitle: true,
          title: TextField(

            onChanged: (value) => _search(value),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: iconValue,
              onPressed: (){
                isDark = !isDark;
                context.read<AdoptionBloc>().add(ThemeToggleEvent.toggle(isDark));
              },
            )
          ],

        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            switch (state) {
              AdoptionLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
              AdoptionError() => Text(state.error),
              SearchedClickedState() => state.store.adoptSearchedList==null
                  ? PetListView(petList: state.store.adoptList!)
                  : PetListView(petList: state.store.adoptSearchedList!),
              _ => state.store.adoptList == null
                  ? const SizedBox()
                  : PetListView(petList: state.store.adoptList!)

            }
          ],
        ),

),
    );
  },
);
  }
}
