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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHomePage> {
  var count=0;
  var count1=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("StatefulWidgets"))
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Count :${count}", style: TextStyle(fontSize: 20),),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: () {
                setState(() {
                  count++;
                });
              }, child: Text("Increment Count")),

              // Text("${count1}"),
              // ElevatedButton(onPressed: () {
              //   count1++;
              //   print(count1);
              // }, child: Text("click"))
            ],
          ),
        )
    );
  }
}
