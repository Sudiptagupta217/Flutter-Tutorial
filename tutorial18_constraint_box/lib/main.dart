import 'package:flutter/material.dart';

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
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.ac_unit),
              Text("Constraint Box"),
            ],
          ),
        ),
        body: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: 60,
                maxWidth: 120,
                minHeight: 50,
                minWidth: 100),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("click"),
            )));
  }
}
