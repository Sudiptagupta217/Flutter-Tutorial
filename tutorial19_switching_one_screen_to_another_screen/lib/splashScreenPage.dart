import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorial19_switching_one_screen_to_another_screen/introPage.dart';

class SplashScreenPage extends StatefulWidget {

  @override
  State<SplashScreenPage> createState() => SplashScreenPageState();
}

class SplashScreenPageState extends State<SplashScreenPage> {


  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => IntroPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(child: Text("Classico",style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700, color: Colors.white),)),
      ),
    );
  }
}
