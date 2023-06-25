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
          title: Text("Stack"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(width: 200, height: 200, color: Colors.green),
                Container(width: 160, height: 160, color: Colors.white),
                Container(width: 100, height: 100, color: Colors.orange)
              ]),

              Container(
                height: 25,
              ),
              Stack(
                children: [
                  Container(width: 200, height: 200, color: Colors.orange),
                  Positioned(
                      left: 20,
                      top: 20,
                      bottom: 20,
                      right: 20,
                      child: Container(
                          width: 200, height: 200, color: Colors.white)),
                  Positioned(
                    right: 40,
                    left: 40,
                    top: 40,
                    bottom: 40,
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.green,
                    ),
                  )

                ],
              ),

              Container(
                height: 25
              ),
              Stack(
                children: [
                  Container(
                    width: 200,
                    height: 150,
                    color: Colors.orange,
                  ),
                  Positioned(
                    top: 50,
                    child: Container(
                      width: 200,
                      height: 150,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 100,
                    child: Container(
                      width: 200,
                      height: 150,
                      color: Colors.green,
                    ),
                  )
                ],
              ),

              Container(height: 25),
              Container(
                height:300,
                width: 300,
                child: Stack(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      color: Colors.orange,
                    ),
                    Positioned(
                      top: 50,
                      left: 50,
                      child: Container(
                        height: 200,
                        width: 200,
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
