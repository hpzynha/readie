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
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.normal),
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
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 16,
      ),
    ),
  );
}

Widget logoButton({
  required Function() onPress,
  required Widget widget,
}) {
  return SizedBox(
    height: 50,
    width: 80,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 1.0, color: Colors.grey)),
      onPressed: () {},
      child: widget,
    ),
  );
}
