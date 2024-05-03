import 'package:flutter/material.dart';
import 'package:readie/style.dart';
import 'package:readie/widgets/custom_grid.dart';
import 'package:readie/widgets/custom_search_bar.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
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
      body: Column(
        children: [
          const Row(
            children: [
              Text(
                'Popular Genres',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ],
          ),
          const Expanded(child: CustomGrid()),
          GestureDetector(
            onTap: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Explore all genres',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_forward)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
