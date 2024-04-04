import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_image/flutter_svg_image.dart';
import 'package:readie/style.dart';
import 'package:readie/widgets/buttons.dart';
import 'package:readie/widgets/text_form_field.dart';
import 'package:readie/widgets/text_widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                    title: 'register.name'.tr(),
                    hintText: 'register.enterName'.tr()),
                const SizedBox(height: 12),
                LoginTextFormField(
                    title: 'register.email'.tr(),
                    hintText: 'register.enterEmail'.tr()),
                const SizedBox(height: 12),
                LoginTextFormField(
                  title: 'register.password'.tr(),
                  hintText: 'register.enterPassword'.tr(),
                ),
                const SizedBox(height: 12),
                LoginTextFormField(
                  title: 'register.comfirmPassword'.tr(),
                  hintText: 'register.enterComfirmPassword'.tr(),
                ),
                const SizedBox(height: 32),
                PrimaryButton(
                  title: 'register.register'.tr(),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
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
