import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readie/style.dart';

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField(
      {super.key,
      this.hintText,
      required this.title,
      required this.controller,
      this.validator,
      required this.obscureText});
  final String? hintText;
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: rTitleBlackColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            controller: controller,
            validator: validator,
            obscureText: obscureText,
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
        ),
      ],
    );
  }
}
