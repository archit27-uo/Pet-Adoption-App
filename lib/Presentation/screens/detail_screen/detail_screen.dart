import 'dart:math';

import 'package:confetti/confetti.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_adoption_app/Presentation/screens/detail_screen/widget/buildColumn.dart';
import 'package:pet_adoption_app/Presentation/screens/detail_screen/widget/dialogCard.dart';
import 'package:pet_adoption_app/Presentation/screens/history_screen/history_screen.dart';
import '../../../Bloc/adoption_bloc.dart';
import 'package:pet_adoption_app/models/pet_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final _controller = ConfettiController();
  bool isPlaying = true;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

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
            break;
          case AdoptionError():
            break;
          case AdoptionCardClickedState():
            break;
          case AdoptMeClickedState():
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const HistoryScreen()),
            );
          case SearchedClickedState():
            break;

          case OnTapZoomState():
            break;
          case ThemeToggleState():
            break;
        }
      },
      builder: (context, state) {
        final pet = state.store.adoptList![state.store.index!];

        return MaterialApp(
          theme: state.store.themeData,
          home: Stack(alignment: Alignment.topCenter, children: [
            Scaffold(
              body: LayoutBuilder(
                builder: (context, constraint) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildImageCard(context, constraint, pet),
                      buildDetailCard(constraint, pet, context, state)
                    ],
                  );
                },
              ),

            ),
            ConfettiWidget(
              confettiController: _controller,
              blastDirection: pi / 2,
              emissionFrequency: 0.09,
              gravity: 0.01,
            ),
          ]),
        );
      },
    );
  }

  SizedBox buildDetailCard(BoxConstraints constraint, PetModel pet,
      BuildContext context, AdoptionState state) {
    return SizedBox(
      height: constraint.maxHeight * 0.35,
      child: Card(
        color: Colors.brown.shade100,
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                '${pet.name}',
                style: GoogleFonts.singleDay(
                    fontSize: 45,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BuildColumn(
                    attributeName: 'Gender',
                    attributeValue: pet.gender.toString(),
                  ),
                  BuildColumn(
                    attributeName: 'Age',
                    attributeValue: pet.age.toString(),
                  ),
                  BuildColumn(
                    attributeName: 'Price',
                    attributeValue: pet.price.toString(),
                  )
                ],
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.brown),
              onPressed: () async {
                buildShowDialog(context, pet);
                if (isPlaying) {
                  _controller.play();

                  await Future.delayed(const Duration(seconds: 3));
                  _controller.stop();
                }

                pet.adoptionStatus = 'Already Adopted';
                context
                    .read<AdoptionBloc>()
                    .add(AdoptMeClickedEvent(state.store.index!));

                //isPlaying = !isPlaying;
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Adopt Me',
                  style: GoogleFonts.aboreto(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded buildImageCard(
      BuildContext context, BoxConstraints constraint, PetModel pet) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          context.read<AdoptionBloc>().add(OnTapZoomEvent());
        },
        child: UnconstrainedBox(
          child: SizedBox(
            height: constraint.maxHeight * 0.65,
            width: constraint.maxWidth * 0.9,
            child: Hero(
              tag: pet.name.toString(),
              child: pet.image == null
                  ? Image.network(
                      'https://img.freepik.com/free-vector/cute-dog-cartoon-character_1308-146186.jpg?w=740&t=st=1706732862~exp=1706733462~hmac=13f0729ebf8ffcd179cc7346ee040df520e186d98b55fb1e96e3e93159eb9431')
                  : Image.network(
                      pet.image.toString(),
                      fit: BoxFit.contain,
                    ),
            ),
          ),
        ),
      ),
    );
  }


}

