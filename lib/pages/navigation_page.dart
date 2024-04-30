import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:readie/pages/discover_page.dart';
import 'package:readie/pages/home_page.dart';
import 'package:readie/pages/my_books.dart';
import 'package:readie/pages/search_page.dart';
import 'package:readie/style.dart';

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
    const SearchPage()
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
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: signUserOut,
              icon: Icon(
                Icons.logout,
                color: rPrimaryColor,
              ))
        ],
      ),
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
                Icons.home,
                color: rPrimaryColor,
                size: width,
              ),
            ),
            IconButton(
              onPressed: () {
                _navigateToPage(1);
              },
              icon: Icon(
                Icons.book_outlined,
                color: rPrimaryColor,
                size: width,
              ),
            ),
            IconButton(
              onPressed: () {
                _navigateToPage(2);
              },
              icon: Icon(
                Icons.explore,
                color: rPrimaryColor,
                size: width,
              ),
            ),
            IconButton(
              onPressed: () {
                _navigateToPage(3);
              },
              icon: Icon(
                Icons.search,
                color: rPrimaryColor,
                size: width,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
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