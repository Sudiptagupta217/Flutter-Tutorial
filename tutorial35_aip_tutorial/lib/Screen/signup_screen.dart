import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

   String BASE_URL = "https://reqres.in/";

  //signup method create   and signup and login method are same just change the url and required value
  void signUp(String email, password) async{
    try{
      Response response =await post(
        Uri.parse(BASE_URL+"api/register"),
        body: {
          'email':email,
          'password':password
        }
      );
      if(response.statusCode==200){
        print("account create successfully");
        var data = jsonDecode(response.body.toString()); // get the response valur
        print(data);
      }else{
        print("failed");
      }
    }
    catch(e){
      print(e.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SinUp")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: "email"),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(Size(MediaQuery.of(context).size.width, 50)),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Set background color
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color
                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)), // Set padding
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Set border radius
                      side: BorderSide(color: Colors.blue), // Set border color
                    ),
                  ),
                ),
                onPressed: () {
                  signUp(emailController.text.toString(), passwordController.text.toString());
                },
                child: Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}
