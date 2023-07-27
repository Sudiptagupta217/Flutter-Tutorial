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

  loadData() async {
    notesList = dbHelper!.getNotesList();
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
          onPressed: () {
            dbHelper!
                .insert(NotesModel(
                    title: 'first note11',
                    age: 22,
                    description: "kj oa okao oa ooaj ao",
                    email: "ah@gmaa.com"))
                .then((value) {
              setState(() {
                notesList = dbHelper!.getNotesList();
              });
              print("data added");
            }).onError((error, stackTrace) {
              print(error.toString());
            });
          },
          child: Icon(Icons.add),
        ),
        body: Column(children: [
          Expanded(
            child: FutureBuilder(
                future: notesList,
                builder: (context, AsyncSnapshot<List<NotesModel>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      reverse: false,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            dbHelper!.update(NotesModel(
                                id: snapshot.data![index].id!,
                                title: "title",
                                email: "email",
                                age: 55,
                                description: "description"));
                            setState(() {
                              notesList = dbHelper!.getNotesList();
                            });
                          },
                          child: Dismissible(
                            direction: DismissDirection.endToStart,
                            background: Container(
                              child: Icon(Icons.delete_forever),
                              color: Colors.red,
                            ),
                            onDismissed: (direction) {
                              setState(() {
                                dbHelper!.delete(snapshot.data![index].id!);
                                notesList = dbHelper!.getNotesList();
                                snapshot.data!.remove(snapshot.data![index]);
                              });
                            },
                            key: ValueKey<int>(snapshot.data![index].id!),
                            child: Card(
                              child: ListTile(
                                // contentPadding: EdgeInsets.all(0),
                                title: Text(
                                    snapshot.data![index].title.toString()),
                                subtitle: Text(snapshot.data![index].description
                                    .toString()),
                                trailing:
                                    Text(snapshot.data![index].age.toString()),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          )
        ]));
  }
}
