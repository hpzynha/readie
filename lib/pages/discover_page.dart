import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readie/styles/colors.dart';
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
          Row(
            children: [
              Text('Popular Genres',
                  style: GoogleFonts.lato(fontSize: 24, color: rTertiart)),
            ],
          ),
          const Expanded(child: CustomGrid()),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Explore all genres',
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    color: rTertiart,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.arrow_forward)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
