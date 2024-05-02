import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:readie/style.dart';
import 'package:readie/widgets/custom_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(
            child: Row(
              children: [
                SizedBox(width: 20),
                const CustomSearchBar(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications,
                      size: 35,
                      color: rPrimaryColor,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
