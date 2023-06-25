import 'package:flutter/material.dart';
import 'package:tutorial11_creating_custom_widget/widget/roundbutton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

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
    return Scaffold(
        appBar: AppBar(
          title: Text("Creating a Custom Widget"),
        ),
        body: Column(
          children: [
            Container(
              child: RoundButton(
                icon: Icon(Icons.add),
                btnName: 'Submit',
                callback: () {
                  print('hello flutter');
                },
                textStyle: TextStyle(color: Colors.white,fontSize: 20),
              ),

            ),
            Container(
              height: 10,
            ),
            RoundButton(btnName: "hello click me",
            bgColor: Colors.green,)

          ],
        ));
  }
}
