

import 'dart:convert';

import 'package:api_implimentation/console/api_consts.dart';
import 'package:http/http.dart' as http;

class ApiHelper {

  static logIn(String email, String password) async {
    try {
      var uri = Uri.https(BASE_URL, LogIn);

      var response = await http.post(uri,
        body: {
          "email": email,
          "password": password
        },
      );

      var data = jsonDecode(response.body);
      print(data["token"]);

      if (response.statusCode == 200) {
        return "success";
      } else {
        print(data["error"]);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static SignUp(String email, String password) async {
    try {
      var uri = Uri.https(BASE_URL, Signup);

      var response = await http.post(uri,
          body: {
            "email": email,
            "password": password
          }
      );

      var data = jsonDecode(response.body);
      print(data["token"]);

      if (response.statusCode == 200) {
        return "success";
      }
      else {
        print(data["error"]);
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
}