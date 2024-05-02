import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_image/flutter_svg_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readie/pages/auth/auth_page.dart';

import 'package:readie/style.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: rPrimaryColor,
      splash: Column(
        children: [
          Image(
            image: SvgImage.asset('assets/images/readieWhiteLogo.svg'),
          ),
        ],
      ),
      duration: 2500,
      nextScreen: const AuthPage(),
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 250,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
