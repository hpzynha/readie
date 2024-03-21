import 'package:flutter/material.dart';

import 'package:readie/style.dart';

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
          Center(
            child: Text(
              "Welcome to Readie",
              style: TextStyle(
                color: rPrimaryColor,
                fontSize: 26,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 60),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 9, bottom: 5),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OutlinedButton(onPressed: () {}, child: Text("Login")),
                    const SizedBox(width: 10),
                    OutlinedButton(onPressed: () {}, child: Text("Sign Up")),
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
