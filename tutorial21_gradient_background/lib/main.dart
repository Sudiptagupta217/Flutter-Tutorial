import 'package:flutter/material.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gradient Background")),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
         //   gradient: RadialGradient(
                colors: [Color(0xffa18cd1), Color(0xfffbc2eb)],
               // begin: FractionalOffset(1.0,0.5),
               // end: FractionalOffset(0.0,0.5),
                //center: Alignment.topRight,
                stops: [0.0, 0.2, 1.0]
            )
        ),
      ),
    );
  }
}
