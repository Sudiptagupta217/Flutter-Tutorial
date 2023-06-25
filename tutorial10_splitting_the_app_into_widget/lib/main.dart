import 'package:flutter/material.dart';
import 'package:tutorial9_splitting_the_app_into_widget/widgets/topbar_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Splitting the App into Widget"),
        ),
        body: Column(
          children: [
            TobBar(),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.orange,
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                      ),
                      title: Text('name'),
                      subtitle: Text("sun title"),
                      trailing: Icon(Icons.delete),
                    ),
                  ),
                  itemCount: 10,
                  scrollDirection: Axis.vertical,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                    ),
                  ),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.deepPurple,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    crossAxisCount: 7,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      Container(color: Colors.white),
                      Container(color: Colors.white),
                      Container(color: Colors.white),
                      Container(color: Colors.white),
                      Container(color: Colors.white),
                      Container(color: Colors.white),
                      Container(color: Colors.white),
                      Container(color: Colors.white),
                      Container(color: Colors.white),
                      Container(color: Colors.white),
                      Container(color: Colors.white),
                      Container(color: Colors.white),
                      Container(color: Colors.white),
                      Container(color: Colors.white)
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
