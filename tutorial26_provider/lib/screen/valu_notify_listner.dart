import 'package:flutter/material.dart';

class NotifyListnerScreen extends StatelessWidget {
   NotifyListnerScreen({super.key});

  ValueNotifier _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(title: Text("Provider_tutorial")),
      body: Center(child:
          ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(_counter.value.toString(),style: TextStyle(fontSize: 50),);
              },)

      ),
floatingActionButton:  FloatingActionButton(
  onPressed: () {
_counter.value++;
print(_counter.value.toString());
  },
  child: Icon(Icons.add),
),
    );
  }
}
