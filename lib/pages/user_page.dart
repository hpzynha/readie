import 'package:flutter/material.dart';
import 'package:readie/service/auth_service.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          IconButton(
            onPressed: () => AuthService().signOut(),
            icon: const Icon(
              Icons.logout,
              color: Colors.amber,
            ),
          ),
          const Text('ProfilePage'),
        ],
      )),
    );
  }
}
