import 'package:fictional_spork/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fictional Spork',
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xff043927),
        colorScheme: const ColorScheme.light(
          primary: Color(0xff043927),
        ),
        primaryColorDark: const Color(0xffa3c58b),
        primaryColorLight: const Color.fromARGB(255, 2, 38, 26),
      ),
      home: const App(),
    );
  }
}
