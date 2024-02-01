import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../models/pet_model.dart';

Future<dynamic> buildShowDialog(BuildContext context, PetModel pet) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 200,
            child: Column(
              children: [
                Text(
                  'Congratulations🥳',
                  style: GoogleFonts.aboreto(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'You’ve now '
                      'adopted🎉'
                      '${pet.name}',
                  style: GoogleFonts.aboreto(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ],
            ),
          ),
        );
      });
}