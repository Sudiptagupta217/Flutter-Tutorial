import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../Models/user_model.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<UserModel> userList = [];

  Future<List<UserModel>> getUserApi () async{
    final response =await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      userList.clear();
      for(Map i in data){
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    }else{

      return userList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, AsyncSnapshot<List<UserModel>> snapshot){
                if(!snapshot.hasData){
                  return CircularProgressIndicator();
                }else{
              return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return Card(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(snapshot.data![index].name.toString()),
                      Text(snapshot.data![index].email.toString()),
                      Text(snapshot.data![index].username.toString()),
                      Text(
                              "City is "+snapshot.data![index].address!.city.toString()+
                              "\n zipcode is"+snapshot.data![index].address!.zipcode.toString()+
                          "\n lat lng is "+snapshot.data![index].address!.geo!.lat.toString()+" and "+snapshot.data![index].address!.geo!.lng.toString()

                      ),
                    ],
                  ),
                ));

              },);

                }
            },)
          ),
        ],
      ),

    );
  }
}
