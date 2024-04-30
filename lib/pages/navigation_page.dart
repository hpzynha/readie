import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:readie/pages/discover_page.dart';
import 'package:readie/pages/home_page.dart';
import 'package:readie/pages/my_books.dart';
import 'package:readie/pages/search_page.dart';

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
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                _navigateToPage(0);
              },
              icon: const Icon(
                Icons.home,
                size: 35,
              ),
            ),
            IconButton(
              onPressed: () {
                _navigateToPage(1);
              },
              icon: const Icon(
                Icons.book_outlined,
                size: 35,
              ),
            ),
            IconButton(
              onPressed: () {
                _navigateToPage(2);
              },
              icon: const Icon(
                Icons.explore,
                size: 35,
              ),
            ),
            IconButton(
              onPressed: () {
                _navigateToPage(3);
              },
              icon: const Icon(
                Icons.search,
                size: 35,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
