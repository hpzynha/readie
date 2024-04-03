import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:readie/style.dart';
import 'package:readie/widgets/buttons.dart';
import 'package:readie/widgets/text_form_field.dart';
import 'package:readie/widgets/text_widgets.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

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
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 46, right: 57),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextTitle(
              title: 'forgotPassword.forgotPassword'.tr(),
              text: 'forgotPassword.subtitleForgotPassword'.tr(),
            ),
            const SizedBox(height: 20),
            LoginTextFormField(
              title: 'forgotPassword.email'.tr(),
              hintText: 'forgotPassword.enterEmail'.tr(),
            ),
            const SizedBox(height: 45),
            PrimaryButton(
              title: 'forgotPassword.sendCode'.tr(),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
