import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Bloc/adoption_bloc.dart';
import '../../../../models/pet_model.dart';

class PetListView extends StatelessWidget {
  final List<PetModel> petList;
  const PetListView({Key? key, required this.petList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: petList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.read<AdoptionBloc>().add(
                      AdoptionCardClickedEvent(index),
                    );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  color: Colors.black,
                  elevation: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Hero(
                          tag: petList[index].name.toString(),
                          child: petList[index].image == null
                              ? Image.network(
                                  'https://img.freepik.com/free-vector/cute-dog-cartoon-character_1308-146186.jpg?w=740&t=st=1706732862~exp=1706733462~hmac=13f0729ebf8ffcd179cc7346ee040df520e186d98b55fb1e96e3e93159eb9431')
                              : Image.network(
                                  '${petList[index].image}',
                                  height: 350,
                                  width: 330,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, _, __) {
                                    return const SizedBox();
                                  },
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 30),
                          ),
                          Text(
                            '${petList[index].name}',
                            style: GoogleFonts.aboreto(
                                fontSize: 25, color: Colors.white),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ],
                      ),
                      Text(
                        '${petList[index].adoptionStatus}',
                        style: GoogleFonts.aboreto(
                            fontSize: 20, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
