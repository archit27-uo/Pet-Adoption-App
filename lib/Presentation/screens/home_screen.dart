import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:pet_adoption_app/Presentation/screens/detail_screen.dart';
import '../../Bloc/adoption_bloc.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  void initState() {
    super.initState();
    context.read<AdoptionBloc>().add(AdoptionFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          BlocBuilder<AdoptionBloc, AdoptionState>(builder: (context, state) {
            if (state is AdoptoionFailure) {
              return Text(state.error);
            }
            if (state is! AdoptionSuccess) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final petList = state.petList;

            return Expanded(
              child: ListView.builder(
                  itemCount: petList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        context.read<AdoptionBloc>().add(PetClicked(index,petList));
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Detail_Screen()),);
                      },
                      child: Card(
                        color: Colors.black,
                        elevation: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.network(
                              '${petList[index].image}',
                              errorBuilder: (context, _, __) {
                                return SizedBox();
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 30),
                                ),

                                   Text(
                                    '${petList[index].name}',
                                    style: GoogleFonts.pacifico(
                                    fontSize: 35, color: Colors.white),
                                  ),
                                SizedBox(width: 10,),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),

                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          })
        ],
      ),
    );
  }
}
