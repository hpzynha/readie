import 'package:flutter/material.dart';
import 'package:readie/style.dart';

class LoginSignupButton extends StatelessWidget {
  const LoginSignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: rProgressbarColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: OutlinedButton(
          onPressed: () {},
          child: const Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
