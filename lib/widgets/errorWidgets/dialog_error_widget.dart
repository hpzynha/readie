import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readie/styles/colors.dart';

Future emailAlreadyInUseDialog({
  required BuildContext context,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'errorDialog.title'.tr(),
            style: GoogleFonts.lato(
              fontSize: 24,
              color: rSecondaryColor,
            ),
          ),
          content: Text(
            'errorDialog.emailAlreadyInUse'.tr(),
            style: GoogleFonts.lato(
              fontSize: 16,
              color: rTertiart,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'errorDialog.okButton'.tr(),
                style: GoogleFonts.lato(
                  fontSize: 24,
                  color: rSecondaryColor,
                ),
              ),
            ),
          ],
        );
      });
}

Future errorToRegisterEmailDialog({
  required String content,
  required BuildContext context,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'errorDialog.title'.tr(),
            style: GoogleFonts.lato(
              fontSize: 24,
              color: rSecondaryColor,
            ),
          ),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'errorDialog.okButton'.tr(),
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: rSecondaryColor,
                ),
              ),
            )
          ],
        );
      });
}
