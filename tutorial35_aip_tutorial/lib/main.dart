import 'package:flutter/material.dart';
import 'package:tutorial35_aip_tutorial/Screen/home_screen.dart';
import 'package:tutorial35_aip_tutorial/Screen/photo_screen.dart';
import 'package:tutorial35_aip_tutorial/Screen/signup_screen.dart';
import 'package:tutorial35_aip_tutorial/Screen/user_screen.dart';

import 'Screen/complex_jron_exampler_screen.dart';
import 'Screen/image_upload+screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      //  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //  useMaterial3: true,
      ),
      home: const SignUpScreen(),
    );
  }
}