import 'package:flutter/material.dart';
import 'package:readie/styles/colors.dart';
import 'package:readie/widgets/user/user_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/text_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userNameText = user?.displayName ?? 'Usuário';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: rBackgroundColor,
        title: textLogo(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                userName(name: userNameText),
                Icon(
                  Icons.percent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
