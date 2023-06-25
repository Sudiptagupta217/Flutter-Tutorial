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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Expanded widgets"),
        ),
        body:
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Expanded( flex: 2 , child: Container(height: 100, color: Colors.amber)),
            //     Expanded( flex : 3, child: Container(width: double.maxFinite, height: 100, color: Colors.lightBlue)),
            //     Expanded( flex: 4,child: Container(width: double.maxFinite, height: 100, color: Colors.orange)),
            //     Expanded(flex: 1,child: Container(height: 100, color: Colors.lightGreen))
            //   ],
            // )
            Container(
          // child: Padding(
          //   padding:EdgeInsets.only(top: 8.0, left: 8),
          //   child: Text("hello world", style: TextStyle(fontSize: 22),),
          margin: EdgeInsets.only(top: 8, left: 10),
          child: Text("hello world in flutter", style: TextStyle(fontSize: 20)),
        ));
  }
}
