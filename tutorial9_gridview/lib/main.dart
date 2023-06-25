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
    var arrayColor=[
      Colors.lightGreen,
      Colors.cyan,
      Colors.redAccent,
      Colors.blue,
      Colors.red,
      Colors.amber,
      Colors.purple,
      Colors.deepPurpleAccent,
      Colors.lime,
      Colors.pink,
    ];
    var arrayName=['A','B','C','D','E','F','G','H','I','J'];
    return Scaffold(
        appBar: AppBar(
          title: Text("CardView"),
        ),
        body:/* GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            Container(color: Colors.blue),
            Container(color: Colors.orange),
            Container(color: Colors.purple),
            Container(color: Colors.greenAccent),
            Container(color: Colors.lightGreen),
            Container(color: Colors.cyan),
            Container(color: Colors.black),
            Container(color: Colors.redAccent),
            Container(color: Colors.blue),
            Container(color: Colors.orange)
          ],
        )*/
  /*  GridView.extent(maxCrossAxisExtent: 100,mainAxisSpacing: 10,crossAxisSpacing: 10,
    children: [
      Container(color: Colors.blue),
      Container(color: Colors.orange),
      Container(color: Colors.purple),
      Container(color: Colors.greenAccent),
      Container(color: Colors.lightGreen),
      Container(color: Colors.cyan),
      Container(color: Colors.black),
      Container(color: Colors.redAccent),
      Container(color: Colors.blue),
      Container(color: Colors.orange)
    ],)*/
      
      GridView.builder(itemBuilder: (context, index) {
        return Container(color: arrayColor[index],
          child:Center(child: Text(arrayName[index], style: TextStyle(color: Colors.white, fontSize: 20),)));
      },
      itemCount: arrayColor.length, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),)
    );
  }
}
