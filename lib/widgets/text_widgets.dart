import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readie/style.dart';

Widget TextTitle({required String title, required String text}) {
  return Column(children: [
    Row(
      children: [
        Text(
          title,
          style: GoogleFonts.lato(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: rTitleBlackColor,
          ),
        ),
      ],
    ),
    const SizedBox(height: 10),
    Row(
      children: [
        Flexible(
          child: Text(
            text,
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    ),
  ]);
}
