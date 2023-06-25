import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/providers/example_one_provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  // double value = 1.0;

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<ExampleProvider>(context, listen:  true);
    print("build");
    return Scaffold(
      appBar: AppBar(title: Text("example one")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleProvider>(
            builder: (context, value, child) {
              return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  //value = val;
                  //print(value);
                  // setState(() {});
                  value.setValue(val);
                  print(value.value);
                },
              );
            },
          ),
          Consumer<ExampleProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.green.withOpacity(value.value),
                      child: Center(child: Text("container1")),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.red.withOpacity(value.value),
                      child: Center(child: Text("container2")),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
