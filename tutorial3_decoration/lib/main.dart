import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
       // color: Colors.cyan,
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.lightGreen,
                // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),topRight: Radius.circular(30))
                // borderRadius: BorderRadius.all(Radius.circular(50))
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.black,
                  width: 2
                ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                 spreadRadius: 12,
                  blurRadius: 25
                )
              ]


            ),
          ),
        ),
      ),
    );
  }
}
