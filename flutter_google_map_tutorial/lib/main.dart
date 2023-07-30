import 'package:flutter/material.dart';

import 'convert_latlong_to_address.dart';
import 'homepage.dart';

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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  ConvertLatLongToAddress(),
    );
    //AIzaSyACgCDW23DkmkS2JmxGX6eu3tLyVAP5w7s
  }
}
