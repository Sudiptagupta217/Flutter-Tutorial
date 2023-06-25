import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorial19_switching_one_screen_to_another_screen/myHomePage.dart';

class IntroPage extends StatefulWidget {
  @override
  State<IntroPage> createState() => IntroPageState();
}

class IntroPageState extends State<IntroPage> {
  var nameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IntroPage"),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("User Input",style: TextStyle(fontSize: 25),),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: nameController,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => MyHomePage(nameController.text.toString()),));
                  },child: Text("Next"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
