import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  //const MyHomePage();
  var nameFromHome;
  MyHomePage(this.nameFromHome);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Switching One Screen to Another Screen"),
        ),
        body:Container(

          color: Colors.blueGrey,
          child: Center(child: Text("Wellcome , ${nameFromHome}", style: TextStyle(fontSize: 25,color: Colors.white),)),
        ) );
  }
}