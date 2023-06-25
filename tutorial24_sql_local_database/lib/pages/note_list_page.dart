import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorial24_sql_local_database/pages/note_detail_page.dart';

class NoteListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListPageState();
  }
}

class NoteListPageState extends State<NoteListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: getNoteDetails(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("floating button");
        moveNextNavigation("Add Note");
        },
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }


  ListView getNoteDetails() {
    var count = 0;
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          color: Colors.white,
          elevation: 2,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.arrow_forward_ios_rounded),
            ),
            title: Text("hello world",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            subtitle: Text("12/2/2010",
                style: TextStyle(fontSize: 15, fontStyle: FontStyle.normal)),
            trailing: Icon(Icons.delete, color: Colors.grey),
            onTap: () {
              debugPrint("Helloworld");
              moveNextNavigation("Edit Note");
            },
          ),
        );
      },

      itemCount: count,
    );
  }

    void moveNextNavigation(String title) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return NoteDetailPage(title);
      },));
    }
  }


