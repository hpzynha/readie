import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readie/style.dart';

class CustomAuthTextFormField extends StatefulWidget {
  final String? hintText;
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool showVisibilityIcon;

  const CustomAuthTextFormField(
      {super.key,
      this.hintText,
      required this.title,
      required this.controller,
      this.validator,
      required this.obscureText,
      required this.showVisibilityIcon});

  @override
  State<CustomAuthTextFormField> createState() =>
      _CustomAuthTextFormFieldState();
}

class _CustomAuthTextFormFieldState extends State<CustomAuthTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.title,
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
            controller: widget.controller,
            validator: widget.validator,
            obscureText: _obscureText,
            autofocus: true,
            decoration: InputDecoration(
              labelText: "",
              hintText: widget.hintText,
              suffixIcon: widget.showVisibilityIcon
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility))
                  : null,
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
