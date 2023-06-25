import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'databasehelper.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD Sqlite"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: ()async{
              int i = await DatabaseHelper.instance.insert({
                DatabaseHelper.columnName:"india"
              });
              print('the insert id is $i');
            }, child: Text("Insert"), style: ElevatedButton.styleFrom(backgroundColor: Colors.blue)),

            ElevatedButton(onPressed: (){

            }, child: Text("Query"), style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),),
            ElevatedButton(onPressed: (){}, child: Text("Update"), style:  ElevatedButton.styleFrom(backgroundColor: Colors.green),),
            ElevatedButton(onPressed: (){}, child: Text("Delete"), style:  ElevatedButton.styleFrom(backgroundColor: Colors.red),),
          ],
        ),
      )
    );
  }
}
