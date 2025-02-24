import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../styles/colors.dart';

Widget userName({required String name}) {
  return Row(
    children: [
      Text(
        'Bem Vindo, ',
        style: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: rTertiart,
        ),
      ),
      Text(
        name,
        style: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: rTertiart,
        ),
      ),
    ],
  );
}
