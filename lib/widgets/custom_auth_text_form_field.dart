import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readie/style.dart';

enum FieldType {
  email,
  password,
}

class CustomAuthTextFormField extends StatefulWidget {
  final String? hintText;
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool showVisibilityIcon;
  final Widget icon;
  final bool validateEmail;
  final FieldType fieldType;

  const CustomAuthTextFormField(
      {super.key,
      this.hintText,
      required this.title,
      required this.controller,
      this.validator,
      required this.obscureText,
      required this.showVisibilityIcon,
      required this.icon,
      required this.validateEmail,
      required this.fieldType});

  @override
  State<CustomAuthTextFormField> createState() =>
      _CustomAuthTextFormFieldState();
}

class _CustomAuthTextFormFieldState extends State<CustomAuthTextFormField> {
  late bool _obscureText;
  bool _showError = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _onTextChanged(String text) {
    setState(() {
      if (widget.fieldType == FieldType.email) {
        // Check if email is valid
        _showError = !widget.validateEmail || !isValidEmail(text);
      } else if (widget.fieldType == FieldType.password) {
        // Show error if the text length is less than 6 characters for password
        _showError = text.length < 6;
      }
    });
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    String errorText = '';
    // Determine the error message based on the field type
    if (_showError) {
      switch (widget.fieldType) {
        case FieldType.email:
          errorText = 'Email is required';
          break;
        case FieldType.password:
          errorText = 'Password is required';
          break;
      }
    }
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
            keyboardType:
                widget.validateEmail ? TextInputType.emailAddress : null,
            inputFormatters: widget.validateEmail
                ? [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._]'))]
                : null,
            onChanged: _onTextChanged,
            decoration: InputDecoration(
              labelText: "",
              hintText: widget.hintText,
              prefixIcon: widget.icon,
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
              errorText: _showError ? errorText : null,
              hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: rPrimaryColor,
                  width: 2,
                ),
              ),
              fillColor: rSecondaryColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: rSecondaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: rPrimaryColor, width: 1.5),
              ),
              errorBorder: OutlineInputBorder(
                // Set the error border here
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
