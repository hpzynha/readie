import 'package:flutter/material.dart';
import 'package:readie/style.dart';
import 'package:readie/widgets/custom_search_bar.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(
            child: Row(
              children: [
                const SizedBox(width: 20),
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
      body: const Text('DiscoverPage'),
    );
  }
}
