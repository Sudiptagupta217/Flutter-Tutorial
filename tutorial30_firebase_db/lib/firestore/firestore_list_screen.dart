import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tutorial30_firebase/ui/auth/login_screen.dart';
import 'package:tutorial30_firebase/utils/utils.dart';
import 'add_firestore_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreScreen extends StatefulWidget {
  const FireStoreScreen({super.key});

  @override
  State<FireStoreScreen> createState() => _FireStoreScreenState();
}

class _FireStoreScreenState extends State<FireStoreScreen> {
  final auth = FirebaseAuth.instance;
  final editController = TextEditingController();
  final fireStore = FirebaseFirestore.instance.collection("users").snapshots();

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
        title: Text("FireStore PostScreen"),
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
                builder: (context) => AddFireStoreData(),
              ));
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
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
          StreamBuilder<QuerySnapshot>(
            stream: fireStore,
            builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {

              if(snapshot.connectionState==ConnectionState.waiting)
              return CircularProgressIndicator();

              if(snapshot.hasError)
                return Text("some error");

              return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data!.docs[index]['title'].toString()),
                        );
                      },)

                );

            },),
    ])
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

            }, child: Text("Update"))
          ],
        );
      } ,);
  }
}
