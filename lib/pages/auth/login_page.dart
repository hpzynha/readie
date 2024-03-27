import 'package:flutter/material.dart';
import 'package:flutter_svg_image/flutter_svg_image.dart';

import 'package:readie/style.dart';
import 'package:readie/widgets/buttons.dart';
import 'package:readie/widgets/text_form_field.dart';

import 'package:easy_localization/easy_localization.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child:
                Image(image: SvgImage.asset('assets/images/PrimaryLogo.svg')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 60),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'login.login'.tr(),
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'login.loginToUseTheApp'.tr(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 29),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'login.email'.tr(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: rTitleBlackColor),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                LoginTextFormField(hintText: 'login.enterEmail'.tr()),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'login.password'.tr(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: rTitleBlackColor),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                LoginTextFormField(
                  hintText: 'login.enterPassword'.tr(),
                ),
                const SizedBox(height: 32),
                Column(
                  children: [
                    PrimaryButton(
                      title: 'login.login'.tr(),
                      onPressed: () {},
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        textButton(
                          text: 'login.forgotPassword'.tr(),
                          onPress: () {},
                          color: rSecondaryTextColor,
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Dont have an account?',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            )),
                        textButton(
                            text: 'Register',
                            onPress: () {},
                            color: rPrimaryColor)
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
