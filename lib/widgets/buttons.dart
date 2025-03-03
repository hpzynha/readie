import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readie/styles/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, required this.title, required this.onPressed});

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: BoxDecoration(
          color: rSecondaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide.none,
          ),
          child: Text(
            title,
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: rBackgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}

Widget textButton({
  required String text,
  required Function() onPress,
  required Color color,
}) {
  return TextButton(
    onPressed: onPress,
    style: ButtonStyle(
      overlayColor: WidgetStateProperty.resolveWith<Color>(
        (states) {
          return rPrimaryColor.withValues(
              alpha: 0.1); // Set overlay color to transparent
        },
      ),
    ),
    child: Text(
      text,
      style: GoogleFonts.lato(color: color, fontSize: 16),
    ),
  );
}

Widget logoButton({
  required Function() onPress,
  required Widget widget,
}) {
  return SizedBox(
    height: 50,
    child: OutlinedButton(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(2),
        side: WidgetStateProperty.all<BorderSide?>(
            BorderSide(width: 1.0, color: rSecondaryColor)),
        overlayColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            return rPrimaryColor.withValues(
                alpha: 0.1); // Set overlay color to transparent
          },
        ),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(0.5),
        ),
      ),
      onPressed: onPress,
      child: widget,
    ),
  );
}

Widget googleButton({
  required Function() onPress,
  required String title,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.2),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 1),
        ),
      ],
    ),
    child: OutlinedButton(
      onPressed: onPress,
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(2),
        side: WidgetStateProperty.all<BorderSide?>(BorderSide.none),
        overlayColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            return rPrimaryColor.withValues(
                alpha: 0.1); // Set overlay color to transparent
          },
        ),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          Image.network(
            'http://pngimg.com/uploads/google/google_PNG19635.png',
            height: 30,
            width: 30,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: rTertiart,
            ),
          ),
        ],
      ),
    ),
  );
}
