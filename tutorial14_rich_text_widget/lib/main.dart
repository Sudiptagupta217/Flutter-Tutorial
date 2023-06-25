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
        title: Text('Rich Text Widget'),
      ),
      body:
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 20,
            color: Colors.grey),
            children: [
              TextSpan(text: "hello"),
              TextSpan(text: "world", style: TextStyle(color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold))
            ]
          ),
        )
    );
  }
}
