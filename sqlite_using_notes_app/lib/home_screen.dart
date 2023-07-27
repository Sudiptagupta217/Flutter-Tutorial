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

  //get notes
  late Future<List<NotesModel>> notesList;

  loadData()async{
    notesList= dbHelper!.getNotesList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper();
    loadData();
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
          children: [
            FutureBuilder(
              future: notesList,
              builder: (context, AsyncSnapshot<List<NotesModel>> snapshot) {
                return
                  ListView.builder(itemBuilder: (context, index) {
                    return
                      Card(child:
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text(snapshot.data![index].title.toString()),
                      ),
                      );
                  },
                  );
              }
          )
              ])
              );
  }
}
