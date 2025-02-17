import 'package:flutter/material.dart';
import 'package:readie/styles/colors.dart';

class CustomGrid extends StatelessWidget {
  const CustomGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          6,
          (index) {
            return Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: rSecondaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
            );
          },
        ),
      ),
    );
  }
}
