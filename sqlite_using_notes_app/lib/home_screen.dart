import 'package:flutter/material.dart';
import 'package:sqlite_using_notes_app/db_helper.dart';
import 'package:sqlite_using_notes_app/notes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  DBHelper? dbHelper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper(); 
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App"),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          dbHelper!.insert(
            NotesModel(
              title: 'first note',
              age: 22,
              description: "kj oa okao oa ooaj ao",
              email: "ah@gmaa.com"
            )
          ).then((value) {
            print("data added");
          }).onError((error, stackTrace) {
            print(error.toString());
          });
        },
        child: Icon(Icons.add),
      ),

      body: Column(
          children: [],
      ),
    );
  }
}
