import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_image/flutter_svg_image.dart';
import 'package:readie/style.dart';
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: rPrimaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Image(image: SvgImage.asset('assets/images/PrimaryLogo.svg')),
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
                  title: 'register.email'.tr(),
                  hintText: 'register.enterEmail'.tr(),
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
                  title: 'register.password'.tr(),
                  hintText: 'register.enterPassword'.tr(),
                  validateEmail: false,
                  fieldType: FieldType.password,
                ),
                const SizedBox(height: 12),
                CustomAuthTextFormField(
                  controller: _controllerConfirmPassword,
                  obscureText: true,
                  showVisibilityIcon: true,
                  icon: const Icon(Icons.lock),
                  title: 'register.comfirmPassword'.tr(),
                  hintText: 'register.enterComfirmPassword'.tr(),
                  validateEmail: false,
                  fieldType: FieldType.password,
                ),
                const SizedBox(height: 32),
                PrimaryButton(
                  title: 'register.register'.tr(),
                  onPressed: registerUser,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
