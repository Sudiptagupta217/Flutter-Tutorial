import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tutorial30_firebase/ui/auth/login_screen.dart';
import 'package:tutorial30_firebase/ui/posts/add_posts.dart';
import 'package:tutorial30_firebase/utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref("post");
  final searchFilter = TextEditingController();
  final editController = TextEditingController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   ref.onValue.listen((event) {
  //
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("PostScreen"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                });
              },
              icon: Icon(Icons.logout)),
          SizedBox(width: 10)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPostScreen(),
              ));
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: searchFilter,
              decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              onChanged: (String value) {
                setState(() {});
              },
            ),
          ),
          // Expanded(child: StreamBuilder(
          //   stream: ref.onValue,
          //   builder: (context, AsyncSnapshot<DatabaseEvent> snapshot){
          //     if(!snapshot.hasData){
          //       return CircularProgressIndicator();
          //     }else{
          //       Map<dynamic, dynamic> map = snapshot.data!.snapshot.value as dynamic;
          //       List<dynamic> list =[];
          //       list.clear();
          //       list=map.values.toList();
          //
          //       return ListView.builder(
          //         itemCount: snapshot.data!.snapshot.children.length,
          //           itemBuilder:(context, index) {
          //             return ListTile(
          //               title: Text(list[index]['title']),
          //             );
          //           }, );
          //     }
          //   },
          // )),
          Expanded(
              child: FirebaseAnimatedList(
                  query: ref,
                  defaultChild: Text("Loading"),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    final title = snapshot.child('title').value.toString();
                    if (searchFilter.text.isEmpty) {
                      return ListTile(
                        title: Text(snapshot.child('title').value.toString()),
                        subtitle: Text(snapshot.child('id').value.toString()),
                        trailing: PopupMenuButton(
                          icon:Icon(Icons.more_vert) ,
                          itemBuilder: (BuildContext context) =>[
                            PopupMenuItem(
                                value:1,
                                child:ListTile(
                                  onTap: (){
                                    Navigator.pop(context);
                                    showMyDialog(title,snapshot.child('id').value.toString());
                                  },
                                  leading: Icon(Icons.edit),
                                  title:Text("Edit") ,
                                ) ),
                            PopupMenuItem(
                                value:1,
                                child:ListTile(
                                  onTap: (){
                                    ref.child(snapshot.child('id').value.toString()).remove();
                                    Navigator.pop(context);
                                  },
                                  leading: Icon(Icons.delete),
                                  title:Text("Delete") ,
                                ) ),
                          ],

                        ),
                      );
                    } else if (title.toLowerCase().contains(searchFilter.text.toLowerCase().toString())) {
                      return ListTile(
                        title: Text(snapshot.child('title').value.toString()),
                        subtitle: Text(snapshot.child('id').value.toString()),
                      );
                    } else {
                      return Container();
                    }
                  })),
        ],
      ),
    );
  }

  Future<void> showMyDialog(String title,String id)async{
    editController.text=title;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update"),
          content: Container(
            child: TextFormField(
            controller: editController,
            ),
          ),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
              }, child: Text("Cancel")),
            TextButton(onPressed: (){
              Navigator.pop(context);
              ref.child(id).update({
                'title':editController.text.toString()
              }).then((value){
                Utils().toastMessage("Updated!");
              }).onError((error, stackTrace) {
                Utils().toastMessage(error.toString());
              });
            }, child: Text("Update"))
          ],
        );
      } ,);
  }

}
