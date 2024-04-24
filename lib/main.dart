import 'package:flutter/material.dart';
import 'package:shop_ease/pages/chooseLanguage.dart';
import 'package:shop_ease/pages/home_page.dart';
import 'package:shop_ease/pages/opening_page.dart';
import 'package:shop_ease/spanish/spanish_homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScienceStudyPro',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          // TODO: Define your primary color
          seedColor: Colors.green,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          // TODO: Define your dark mode color
          seedColor: Colors.indigo,
        ),
      ),
      home: OpeningPage(),
    );
  }
}
