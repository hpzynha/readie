import 'package:flutter/material.dart';
import 'package:readie/pages/books_page.dart';
import 'package:readie/pages/explore_page.dart';
import 'package:readie/pages/home_page.dart';
import 'package:readie/pages/profile_page.dart';
import 'package:readie/pages/search_page.dart';
import 'package:readie/style.dart';

class BottomAppbarController extends StatefulWidget {
  const BottomAppbarController({super.key});
  @override
  State<BottomAppbarController> createState() => _BottomAppbarController();
}

class _BottomAppbarController extends State<BottomAppbarController> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const BooksPage(),
    const ExplorePage(),
    const SearchPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: rProgressbarColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
