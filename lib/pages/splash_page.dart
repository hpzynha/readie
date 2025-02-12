import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readie/pages/auth/auth_page.dart';

import 'package:readie/style.dart';
import 'package:readie/widgets/text_widgets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: rBackgroundColor,
      splash: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textLogo(),
            Text(
              'splash.subLogo'.tr(),
              style: GoogleFonts.alike(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: rPrimaryColor,
              ),
            ),
          ],
        ),
      ),
      duration: 2500,
      nextScreen: const AuthPage(),
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 250,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
