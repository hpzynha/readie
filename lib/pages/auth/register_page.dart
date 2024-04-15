import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_image/flutter_svg_image.dart';
import 'package:readie/style.dart';
import 'package:readie/widgets/buttons.dart';
import 'package:readie/widgets/text_form_field.dart';
import 'package:readie/widgets/text_widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
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
                LoginTextFormField(
                    controller: _controllerEmail,
                    obscureText: false,
                    title: 'register.email'.tr(),
                    hintText: 'register.enterEmail'.tr()),
                const SizedBox(height: 12),
                LoginTextFormField(
                  controller: _controllerPassword,
                  obscureText: true,
                  title: 'register.password'.tr(),
                  hintText: 'register.enterPassword'.tr(),
                ),
                const SizedBox(height: 32),
                PrimaryButton(
                  title: 'register.register'.tr(),
                  onPressed: () {
                    final auth = FirebaseAuth.instance;
                    auth.createUserWithEmailAndPassword(
                        email: _controllerEmail.text,
                        password: _controllerPassword.text);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
