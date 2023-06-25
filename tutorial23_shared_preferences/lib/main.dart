import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  var nameController = TextEditingController();
  var dataName = "No data saved";

  @override
  void initState() {
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("shared_preferences"),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Shared Preferences",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        label: Text("Name"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21)))),
              ),
              ElevatedButton(
                  onPressed: () async {
                    var name = nameController.text.toString();

                    var prefs = await SharedPreferences.getInstance();
                    prefs.setString("name", name);
                  },
                  child: Text("Save")),
              SizedBox(
                height: 20,
              ),
              Text(
                dataName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ));
  }

  Future<void> getValue() async {
    var prefs = await SharedPreferences.getInstance();
    var getName = prefs.getString("name");
    setState(() {
      dataName = getName!;
    });
  }
}