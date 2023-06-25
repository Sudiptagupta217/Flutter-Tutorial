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
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  var arrData=[
    {'name': 'John', 'mobno': '9876543210', 'unread': '3'},
    {'name': 'Emily', 'mobno': '9876543211', 'unread': '1'},
    {'name': 'David', 'mobno': '9876543212', 'unread': '5'},
    {'name': 'Sophia', 'mobno': '9876543213', 'unread': '6'},
    {'name': 'Jacob', 'mobno': '9876543214', 'unread': '2'},
    {'name': 'Olivia', 'mobno': '9876543215', 'unread': '7'},
    {'name': 'Isabella', 'mobno': '9876543216', 'unread': '4'},
    {'name': 'Ethan', 'mobno': '9876543217', 'unread': '9'},
    {'name': 'Ava', 'mobno': '9876543218', 'unread': '2'},
    {'name': 'Liam', 'mobno': '9876543219', 'unread': '6'},
    {'name': 'Jacob', 'mobno': '9876543214', 'unread': '2'},
    {'name': 'Olivia', 'mobno': '9876543215', 'unread': '7'},
    {'name': 'Isabella', 'mobno': '9876543216', 'unread': '4'},
    {'name': 'Ethan', 'mobno': '9876543217', 'unread': '9'},
    {'name': 'Ava', 'mobno': '9876543218', 'unread': '2'},
    {'name': 'Liam', 'mobno': '9876543219', 'unread': '6'}
   // 'adds','adfaed','afdada','dasdfadf','fdafda'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapping Lists"),
      ),
      body:
      Container(
        child:
        ListView(
          children:arrData.map((value){
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: ListTile(
                  leading: Icon(Icons.account_circle,size: 35,color: Colors.white),
                  title: Text(value['name'].toString()),
                  subtitle: Text(value['mobno'].toString()),
                  trailing: CircleAvatar(radius: 10, backgroundColor: Colors.green,
                      child: Text(value['unread'].toString(),style: TextStyle(fontSize: 12,color:Colors.white),)),
                ),
              ),
            );
          }).toList()
        ),)
    );
  }
}