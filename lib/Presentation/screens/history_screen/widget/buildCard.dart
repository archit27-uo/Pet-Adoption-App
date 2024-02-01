import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../models/pet_model.dart';

Card buildCard(List<PetModel> petList, int index) {
  return Card(
    color: Colors.black,
    elevation: 10,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Hero(
            tag: petList[index].name.toString(),
            child: petList[index].image == null
                ? Image.network(
                'https://img.freepik.com/free-vector/cute-dog-cartoon-character_1308-146186.jpg?w=740&t=st=1706732862~exp=1706733462~hmac=13f0729ebf8ffcd179cc7346ee040df520e186d98b55fb1e96e3e93159eb9431')
                : Image.network(
              '${petList[index].image}',
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30),
            ),
            Text(
              '#${index + 1}',
              style: GoogleFonts.pacifico(
                fontSize: 35,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '${petList[index].name}',
              style: GoogleFonts.pacifico(
                fontSize: 35,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}