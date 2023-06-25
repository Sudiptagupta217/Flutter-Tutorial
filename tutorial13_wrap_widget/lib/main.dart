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
          title: Text('wrap widget'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: double.infinity,
            child: Wrap(
                direction: Axis.horizontal,
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.blue,
                    height: 70,
                    width: 70,
                  ),
                  Container(
                    color: Colors.green,
                    height: 70,
                    width: 70,
                  ),
                  Container(
                    color: Colors.yellow,
                    height: 70,
                    width: 70,
                  ),
                  Container(
                    color: Colors.brown,
                    height: 70,
                    width: 70,
                  ),
                  Container(
                    color: Colors.blueAccent,
                    height: 70,
                    width: 70,
                  ),
                  Container(
                    color: Colors.orange,
                    height: 70,
                    width: 70,
                  ),
                  Container(
                    color: Colors.pink,
                    height: 70,
                    width: 70,
                  ),
                  Container(
                    color: Colors.lime,
                    height: 70,
                    width: 70,
                  ),
                  Container(
                    color: Colors.red,
                    height: 70,
                    width: 70,
                  ),
                  Container(
                    color: Colors.grey,
                    height: 70,
                    width: 70,
                  ),
                  Container(
                    color: Colors.lightBlueAccent,
                    height: 70,
                    width: 70,
                  ),
                  Container(
                    color: Colors.indigo,
                    height: 70,
                    width: 70,
                  )
                ]),
          ),
        ));
  }
}
