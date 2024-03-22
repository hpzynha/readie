import 'package:flutter/material.dart';

import 'package:readie/style.dart';
import 'package:readie/widgets/buttons.dart';
import 'package:readie/widgets/text_form_field.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 60),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: rPrimaryColor),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                const SizedBox(height: 10),
                const LoginTextFormField(hintText: 'Enter your email'),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: rPrimaryColor),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const LoginTextFormField(
                  hintText: 'Enter your password',
                ),
                const SizedBox(height: 16),
                Column(
                  children: [
                    const LoginSignupButton(),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: rSecondaryTextColor,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Or login with',
                              style: TextStyle(color: Colors.grey)),
                        ),
                        Expanded(
                            child: Divider(
                          color: rSecondaryTextColor,
                          height: 24,
                        ))
                      ],
                    )
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
