import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/adoption_bloc.dart';

class Detail_Screen extends StatelessWidget {
  const Detail_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final petState = context
        .watch<AdoptionBloc>()
        .state as PetSelected;
    return Scaffold(
      body: BlocBuilder<AdoptionBloc, AdoptionState>(
        builder: (context, state) {

          return Column(
            children: [
              Text(
                  '${petState.petList[petState.index].name}',
                style: TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
