import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_image/flutter_svg_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readie/style.dart';

Widget textTitle({required String title, required String text}) {
  return Row(
    children: [
      Image(
        image: SvgImage.asset('assets/images/peep-59.svg'),
      ),
      Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'login.welcome'.tr(),
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: rSecondaryColor,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'login.subTextWelcome'.tr(),
              style: GoogleFonts.lato(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: rTertiart,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget textLogo() {
  return Text(
    'splash.logo'.tr(),
    style: GoogleFonts.alike(
      fontSize: 34,
      fontWeight: FontWeight.bold,
      color: rSecondaryColor,
    ),
  );
}
