import 'package:flutter/material.dart';
import 'package:tutorial30_firebase/ui/posts/post_screen.dart';
import 'package:tutorial30_firebase/utils/utils.dart';
import 'package:tutorial30_firebase/widgets/round_button.dart';
import 'package:firebase_database/firebase_database.dart';
class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  bool loading = false;
  final databaseRef= FirebaseDatabase.instance.ref('post');
  final postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Add Posts")),
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
            RoundButton(title: "Add",loading: loading, onTap: (){
              setState(() {
                loading=true;
              });
              String id =DateTime.now().microsecondsSinceEpoch.toString();
              databaseRef.child(id).set({
                'id':id,
                'title':postController.text.toString()
              }).then((value) {
                Utils().toastMessage("Post added");
                setState(() {
                  loading=false;
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen(),));
              }).onError((error, stackTrace) {
                Utils().toastMessage(error.toString());
                setState(() {
                  loading=false;
                });
              });
            })
          ],
        ),
      ),
    );
  }

}
