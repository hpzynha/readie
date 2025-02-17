import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:readie/styles/colors.dart';
import 'package:readie/widgets/alert_dialog.dart';
import 'package:readie/widgets/buttons.dart';
import 'package:readie/widgets/custom_auth_text_form_field.dart';
import 'package:readie/widgets/text_widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConfirmPassword =
      TextEditingController();

  void registerUser() {
    final email = _controllerEmail.text.trim();
    final password = _controllerPassword.text.trim();
    final auth = FirebaseAuth.instance;

    //Show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        );
      },
    );
    try {
      if (_controllerPassword.text == _controllerConfirmPassword.text) {
        auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        throw FirebaseAuthException(
          code: 'password-mismatch',
          message: 'Passwords do not match',
        );
      }
      if (mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException {
      if (mounted) {
        Navigator.pop(context);
      }
      showErrorMessage();
    }
  }

  void showErrorMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return customShowAlertDialog(
              title: 'errorMessageDialog.titleDialog'.tr(),
              content: 'errorMessageDialog.errorMessagePassword'.tr(),
              buttonText: 'errorMessageDialog.buttonDialog'.tr(),
              onPress: () => Navigator.pop(context));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: textLogo(),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 60),
            child: Column(
              children: [
                textTitle(
                  title: 'register.register'.tr(),
                  text: 'register.personalInformation'.tr(),
                ),
                const SizedBox(height: 29),
                CustomAuthTextFormField(
                  controller: _controllerEmail,
                  obscureText: false,
                  showVisibilityIcon: false,
                  icon: const Icon(Icons.email),
                  hintText: 'register.email'.tr(),
                  validateEmail: true,
                  fieldType: FieldType.email,
                ),
                const SizedBox(height: 12),
                CustomAuthTextFormField(
                  controller: _controllerPassword,
                  obscureText: true,
                  showVisibilityIcon: true,
                  icon: const Icon(
                    Icons.lock,
                  ),
                  hintText: 'register.password'.tr(),
                  validateEmail: false,
                  fieldType: FieldType.password,
                ),
                const SizedBox(height: 12),
                CustomAuthTextFormField(
                  controller: _controllerConfirmPassword,
                  obscureText: true,
                  showVisibilityIcon: true,
                  icon: const Icon(Icons.lock),
                  hintText: 'register.comfirmPassword'.tr(),
                  validateEmail: false,
                  fieldType: FieldType.password,
                ),
                const SizedBox(height: 32),
                PrimaryButton(
                  title: 'register.register'.tr(),
                  onPressed: registerUser,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'register.alreadyAmember'.tr(),
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: rTertiart,
                ),
              ),
              textButton(
                  text: 'login.login'.tr(),
                  onPress: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  color: rPrimaryColor)
            ],
          )
        ],
      ),
    );
  }
}
