import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildColumn extends StatelessWidget {
  const BuildColumn({
    super.key,
    required this.attributeName,
    required this.attributeValue,
  });
  final String attributeValue;
  final String attributeName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: VerticalDivider(
            thickness: 4.0,
            color: Colors.brown,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(attributeValue,
                style: GoogleFonts.singleDay(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                )),
            const SizedBox(
              height: 2,
            ),
            Text(attributeName,
                style: GoogleFonts.singleDay(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ))
          ],
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
