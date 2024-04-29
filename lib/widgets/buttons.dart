import 'package:flutter/material.dart';
import 'package:readie/style.dart';

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
          color: rPrimaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide.none,
          ),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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
      overlayColor: MaterialStateProperty.resolveWith<Color>(
        (states) {
          return rPrimaryColor
              .withOpacity(0.1); // Set overlay color to transparent
        },
      ),
    ),
    child: Text(
      text,
      style: TextStyle(color: color, fontSize: 16),
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
        elevation: MaterialStateProperty.all(2),
        side: MaterialStateProperty.all<BorderSide?>(
            BorderSide(width: 1.0, color: rSecondaryColor)),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            return rPrimaryColor
                .withOpacity(0.1); // Set overlay color to transparent
          },
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(0.5),
        ),
      ),
      onPressed: onPress,
      child: widget,
    ),
  );
}
