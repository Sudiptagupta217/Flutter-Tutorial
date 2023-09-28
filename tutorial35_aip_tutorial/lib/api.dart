import 'dart:convert';

import 'Models/Photos.dart';
import 'package:http/http.dart' as http;

class ApiHelper{


  static Future<List<dynamic>> getPhotos(List photosList) async {
  final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
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
}}