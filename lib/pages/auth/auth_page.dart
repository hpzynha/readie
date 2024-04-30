import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:readie/pages/auth/login_page.dart';
import 'package:readie/pages/navigation_page.dart';
import 'package:readie/style.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: rPrimaryColor,
              ),
            ),
          );
        } else {
          if (snapshot.hasData) {
            return const NavigationPage();
          } else {
            return const LoginPage();
          }
        }
      },
    ));
  }
}
