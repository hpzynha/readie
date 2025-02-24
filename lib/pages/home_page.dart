import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Expanded(
            child: Row(
              children: [SizedBox(width: 20), Text('oii')],
            ),
          )
        ],
      ),
    );
  }
}
