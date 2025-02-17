import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readie/styles/colors.dart';
import 'package:readie/widgets/buttons.dart';

Widget customShowAlertDialog({
  required String title,
  required String content,
  required String buttonText,
  required Function() onPress,
}) {
  return AlertDialog(
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: TextStyle(color: rTitleBlackColor),
    ),
    content: Text(
      content,
      style: GoogleFonts.lato(fontSize: 16),
    ),
    actions: [textButton(text: 'OK', onPress: onPress, color: rPrimaryColor)],
  );
}
