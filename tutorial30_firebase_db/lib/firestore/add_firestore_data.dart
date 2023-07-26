import 'package:flutter/material.dart';
import 'package:tutorial30_firebase/ui/posts/post_screen.dart';
import 'package:tutorial30_firebase/utils/utils.dart';
import 'package:tutorial30_firebase/widgets/round_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddFireStoreData extends StatefulWidget {
  const AddFireStoreData({super.key});

  @override
  State<AddFireStoreData> createState() => _AddFireStoreDataState();
}

class _AddFireStoreDataState extends State<AddFireStoreData> {

  bool loading = false;
  //final databaseRef= FirebaseDatabase.instance.ref('post');
  final postController = TextEditingController();
  final fireStore = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Add FireStore Posts")),
      body:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 30,),

            TextFormField(
              maxLines: 4,
              controller: postController,
              decoration: InputDecoration(
                hintText: "What is Your mind?",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 70,),
            RoundButton(title: "Add",
                loading: loading,
                onTap: (){
              setState(() {
                loading=true;
              });
              String id = DateTime.now().millisecondsSinceEpoch.toString();

              fireStore.doc().set({
             'title': postController.text.toString(),
                'id':id

               }).then((value) {
                setState(() {
                  loading=false;
                });
              Utils().toastMessage("post added");
             }).onError((error, stackTrace) {
                setState(() {
                  loading=false;
                });
              Utils().toastMessage(error.toString());
             });
            })
          ],
        ),
      ),
    );
  }

}
