import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/language.dart';
import 'package:getx/language_calss.dart';

import 'counter_statemanagement.dart';
import 'mediaquery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',

      //language
      translations: LanguageClass(),
      locale: Locale('en','US'),
      fallbackLocale: Locale("en","US"),

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CounterStateManagement(),
    );
  }
}