import 'package:flutter/material.dart';
import 'package:tutorial19_switching_one_screen_to_another_screen/introPage.dart';
import 'package:tutorial19_switching_one_screen_to_another_screen/myHomePage.dart';
import 'package:tutorial19_switching_one_screen_to_another_screen/splashScreenPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenPage(),
    );
  }
}
