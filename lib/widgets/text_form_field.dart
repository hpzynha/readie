import 'package:flutter/material.dart';
import 'package:readie/style.dart';

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField({super.key, this.hintText});
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        autofocus: true,
        decoration: InputDecoration(
          labelText: "",
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.only(left: 8, bottom: 16),
          hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: rPrimaryColor,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: rPrimaryColor, width: 2),
          ),
        ),
      ),
    );
  }
}
