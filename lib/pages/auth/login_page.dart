import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_image/flutter_svg_image.dart';
import 'package:readie/pages/auth/forgot_password_page.dart';
import 'package:readie/service/auth_service.dart';

import 'package:readie/style.dart';
import 'package:readie/widgets/alert_dialog.dart';
import 'package:readie/widgets/buttons.dart';
import 'package:readie/widgets/custom_auth_text_form_field.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:readie/widgets/text_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> loginUser() async {
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
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException {
      if (mounted) {
        Navigator.pop(context);
      }
      // Wrong email or password
      showErrorMessage();
    }
  }

  void showErrorMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return customShowAlertDialog(
              title: 'errorMessageDialog.titleDialog'.tr(),
              content: 'errorMessageDialog.errorMessageLogin'.tr(),
              buttonText: 'errorMessageDialog.buttonDialog'.tr(),
              onPress: () => Navigator.pop(context));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: textLogo(),

              // Image(
              //   image: SvgImage.asset('assets/images/PrimaryLogo.svg'),
              // ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 60),
              child: Column(
                children: [
                  textTitle(
                    title: 'login.login'.tr(),
                    text: 'login.loginToUseTheApp'.tr(),
                  ),
                  const SizedBox(height: 29),
                  CustomAuthTextFormField(
                    controller: _controllerEmail,
                    obscureText: false,
                    showVisibilityIcon: false,
                    validateEmail: true,
                    icon: const Icon(Icons.email),
                    title: 'login.email'.tr(),
                    hintText: 'login.enterEmail'.tr(),
                    fieldType: FieldType.email,
                  ),
                  const SizedBox(height: 12),
                  CustomAuthTextFormField(
                    controller: _controllerPassword,
                    obscureText: true,
                    showVisibilityIcon: true,
                    validateEmail: false,
                    icon: const Icon(
                      Icons.lock,
                    ),
                    validator: (val) =>
                        val!.length < 6 ? 'Password too short' : null,
                    title: 'login.password'.tr(),
                    hintText: 'login.enterPassword'.tr(),
                    fieldType: FieldType.password,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      textButton(
                        text: 'login.forgotPassword'.tr(),
                        onPress: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const ForgotPasswordPage()));
                        },
                        color: rPrimaryColor,
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                      title: 'login.login'.tr(), onPressed: loginUser),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: rSecondaryTextColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('login.orLoginWith'.tr(),
                            style: TextStyle(color: rSecondaryTextColor)),
                      ),
                      Expanded(
                          child: Divider(
                        color: rSecondaryTextColor,
                        height: 24,
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: connectWithButton(
                          onPress: () => AuthService().signInWithGoogle(),
                          title: 'Continue with Google')),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Dont have an account?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          )),
                      textButton(
                          text: 'login.register'.tr(),
                          onPress: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          color: rPrimaryColor)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
