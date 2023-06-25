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
  RangeValues values = RangeValues(0, 1);

  @override
  Widget build(BuildContext context) {
    RangeLabels labels =
        RangeLabels(values.start.toString(), values.end.toString());

    return Scaffold(
        appBar: AppBar(title: Text("Range Slider"),),
        body: RangeSlider(
          values: values,
          labels: labels,
          divisions: 10,
          min: 0,
          max: 100,
          activeColor: Colors.green,
          inactiveColor: Colors.green.shade100,
          onChanged: (newValue) {
            values = newValue;
            print("${values.start}, ${values.end}");
            setState(() {});
          },
        ));
  }
}
