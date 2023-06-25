import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
    var time = DateTime.now();
    return Scaffold(
        appBar: AppBar(
          title: Text("date time"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("date : ${time.day}/${time.month}/${time.year}"),
            Text('Current time is : ${time}'),
            Text('Current time is : ${DateFormat('Hms').format(time)}'),
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("Current time")),
            Text(
              "Select Date",
              style: TextStyle(fontSize: 22),
            ),
            ElevatedButton(
                onPressed: () async {
                  DateTime? datePicker = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025));

                  if (datePicker != null) {
                    print('${datePicker.year}/${datePicker.month}/${datePicker.day}');
                  }
                },
                child: Text("Select")),
            Text(
              "Select Time",
              style: TextStyle(fontSize: 22),
            ),
            ElevatedButton(
                onPressed: () async {
                  TimeOfDay? tomePicker = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      initialEntryMode: TimePickerEntryMode.input);
                  if(tomePicker!=null) {
                    print('${tomePicker.hour}:${tomePicker.minute}');
                  }
                },
                child: Text("Select"))
          ],
        ));
  }
}
