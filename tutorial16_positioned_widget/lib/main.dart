import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Positioned Widget"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blue,
          child: Stack(
            children: [
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.white,
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ));
  }
}
