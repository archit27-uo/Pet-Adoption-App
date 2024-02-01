import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_adoption_app/Presentation/screens/history_screen/widget/buildCard.dart';
import '../../../Bloc/adoption_bloc.dart';


class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdoptionBloc, AdoptionState>(builder: (context, state) {
      final petList = state.store.adoptHistoryList;
      if (petList == null) {
        return const SizedBox();
      }
      return MaterialApp(
        theme: state.store.themeData,
        home: Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [

              Text(
                'Adopted',
                style: GoogleFonts.aboreto(
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    color: Colors.brown),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: petList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: buildCard(petList, index),
                      );
                    }),
              ),
            ],
          ),
        ),
      );
    });
  }


}
