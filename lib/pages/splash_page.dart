import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:readie/pages/auth/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSplashScreen(
        splash: const Icon(
          Icons.tablet_mac_rounded,
          size: 100,
        ),
        duration: 2500,
        nextScreen: const LoginPage(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
