import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/Photos.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  List<Photos> photosList = [];

  Future<List<Photos>> getPhotos() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      photosList.clear();
      for (Map i in data) {
        //photosList.add(Photos(title: i["title"], url: i["url"]));
        photosList.add(Photos.fromJson(i));
      }
      return photosList;
    } else {
      return photosList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
              future: getPhotos(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loading");
                } else {
                  return ListView.builder(
                    itemCount: photosList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(photosList[index].title.toString()),
                        subtitle: Text(photosList[index].id.toString()),
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(photosList[index].url.toString()),
                        ),
                      );
                    },
                  );
                }
              }),
        )
      ]),
    );
  }
}

// class Photos {
//   String title, url;
//
//   Photos({required this.title, required this.url});
// }
