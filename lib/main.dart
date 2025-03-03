import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:readie/routes.dart';
import 'package:readie/styles/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('pt', 'BR'),
        ],
        startLocale: const Locale('pt', 'BR'),
        fallbackLocale: const Locale('en', 'US'),
        path: 'assets/translations/',
        child: const ReadieApp(),
      ),
    ),
  );
}

class ReadieApp extends StatelessWidget {
  const ReadieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      localeResolutionCallback: (locale, supportedLocales) => locale,
      title: 'READIE',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      initialRoute: Routes.initial,
      routes: Routes.list,
    );
  }

  ThemeData _buildTheme() {
    var baseTheme = ThemeData();
    return baseTheme.copyWith(
      textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: rBackgroundColor,
    );
  }
}
