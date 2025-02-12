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
      Column(
        children: [
          Text(
            'login.welcome'.tr(),
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: rSecondaryColor,
            ),
          ),
          Text(
            'login.subTextWelcome'.tr(),
            softWrap: true,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
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
