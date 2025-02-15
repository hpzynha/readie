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
      overlayColor: WidgetStateProperty.resolveWith<Color>(
        (states) {
          return rPrimaryColor.withValues(
              alpha: 0.1); // Set overlay color to transparent
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

Widget connectWithButton({
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
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    ),
  );
}
