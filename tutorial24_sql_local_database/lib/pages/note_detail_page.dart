import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteDetailPage extends StatefulWidget {

  String appbarTitle;
  NoteDetailPage(this.appbarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailPageState(this.appbarTitle);
  }
}

class NoteDetailPageState extends State<NoteDetailPage> {

  static var _priority = ['high', 'low'];
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  String appbarTitle;
  NoteDetailPageState(this.appbarTitle);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(appbarTitle),
          leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Write some code to control things, when user press Back navigation button in device navigationBar
            moveToLastScreen();
          },),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0,left: 15,right: 15),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: DropdownButton(
                  items: _priority.map((String dropdownString) {
                    return DropdownMenuItem<String>(
                        value: dropdownString, child: Text(dropdownString));
                  }).toList(),
                 // value: "Low",
                  onChanged: (valueselectedByUser) {
                    setState(() {
                      debugPrint("User Selected ${valueselectedByUser}");
                    });
                  }
                ),
              ),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                    label: Text("Title"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(height: 20),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  label: Text("Description"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(onPressed: () {

                      }, child: Text("Save")),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(onPressed: (){

                      }, child: Text("Delete")),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
  }

  void moveToLastScreen() {
    Navigator.pop(context);
  }
}
