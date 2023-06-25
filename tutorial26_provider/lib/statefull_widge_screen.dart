import 'package:flutter/material.dart';

class StatefullWidgetScreen extends StatefulWidget {
  const StatefullWidgetScreen({Key? key}): super(key: key);

  @override
  State<StatefullWidgetScreen> createState() => _StatefullWidgetScreenState();
}

class _StatefullWidgetScreenState extends State<StatefullWidgetScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(title: Text("provider_tutorial")),
      body: Column(
        children: [
          Text(DateTime.now().toString()),
          Container(
            child: Center(child: Text(count.toString(),style: TextStyle(fontSize: 50),)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;
          print(count);
          setState(() {

          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
