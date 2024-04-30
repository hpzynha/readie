import 'package:flutter/material.dart';
import 'package:readie/pages/auth/auth_page.dart';
import 'package:readie/pages/auth/login_page.dart';
import 'package:readie/pages/auth/register_page.dart';
import 'package:readie/pages/discover_page.dart';
import 'package:readie/pages/home_page.dart';
import 'package:readie/pages/my_books.dart';
import 'package:readie/pages/navigation_page.dart';
import 'package:readie/pages/search_page.dart';
import 'package:readie/pages/splash_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list =
      <String, WidgetBuilder>{
    '/': (context) => const SplashPage(),
    '/auth': (context) => const AuthPage(),
    '/login': (context) => const LoginPage(),
    '/register': (context) => const RegisterPage(),
    '/navigation': (context) => const NavigationPage(),
    '/home': (context) => const HomePage(),
    '/mybooks': (context) => const MyBooksPage(),
    '/discover': (context) => const DiscoverPage(),
    '/search': (context) => const SearchPage()
  };
  static String initial = '/';

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
}
