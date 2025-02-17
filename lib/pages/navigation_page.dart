import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:readie/pages/discover_page.dart';
import 'package:readie/pages/home_page.dart';
import 'package:readie/pages/my_books.dart';

import 'package:readie/pages/user_page.dart';
import 'package:readie/styles/colors.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final user = FirebaseAuth.instance.currentUser!;
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const MyBooksPage(),
    const DiscoverPage(),
    const UserPage()
  ];

  void _navigateToPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.08;
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        elevation: 8.0,
        color: rSecondaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                _navigateToPage(0);
              },
              icon: Icon(
                _selectedIndex == 0 ? Icons.home : Icons.home_outlined,
                color: rPrimaryColor,
                size: width,
              ),
            ),
            IconButton(
              onPressed: () {
                _navigateToPage(1);
              },
              icon: Icon(
                _selectedIndex == 1
                    ? Icons.local_library
                    : Icons.local_library_outlined,
                color: rPrimaryColor,
                size: width,
              ),
            ),
            IconButton(
              onPressed: () {
                _navigateToPage(2);
              },
              icon: Icon(
                _selectedIndex == 2 ? Icons.grid_view_sharp : Icons.grid_view,
                color: rPrimaryColor,
                size: width,
              ),
            ),
            IconButton(
              onPressed: () {
                _navigateToPage(3);
              },
              icon: Icon(
                _selectedIndex == 3 ? Icons.person : Icons.person_outline,
                color: rPrimaryColor,
                size: width,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
