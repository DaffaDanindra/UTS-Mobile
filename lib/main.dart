import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
          headlineSmall: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
        ),
      ),
      home: const MyHomePage(title: appTitle),
    );
  }
}
