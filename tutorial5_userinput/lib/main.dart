import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

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
  var usernameText = TextEditingController();
  var passwordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("user input"),
        ),
        body: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: passwordText,
                  obscureText:true,
                  obscuringCharacter: "*",
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                ),
                Container(
                  height: 10,
                ),
                TextField(
                  // enabled: false,
                  controller: usernameText,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue, width: 1)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.black54, width: 1)),
                      suffixText: "User name",
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      prefixIcon: Icon(Icons.person, color: Colors.black)),
                ),
                Container(
                  width: 300,
                  child: ElevatedButton(onPressed: () {
                    String uName= usernameText.text.toString();
                    String uPassword= passwordText.text.toString();
                    print("user name : ${uName} and password : ${uPassword}");
                  },
                      child: Text("login")),
                )
              ],
            ),
          ),
        ));
  }
}