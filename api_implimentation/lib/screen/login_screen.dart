import 'package:api_implimentation/screen/home_screen.dart';
import 'package:api_implimentation/screen/registration_screen.dart';
import 'package:api_implimentation/services/api_helper.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Scaffold(

     appBar: AppBar(
       title: Text("Login Screen"),
     ),


     body: Padding(
       padding: const EdgeInsets.all(10.0),
       child: Column(
         crossAxisAlignment:  CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           TextFormField(
             controller: emailController,
             decoration: InputDecoration(
               label: Text("Email Enter"),
               border: OutlineInputBorder()
             ),
           ),

           SizedBox(height: 20),

           TextFormField(
             controller: passwordController,
             decoration: InputDecoration(
               label: Text("password Enter"),
               border: OutlineInputBorder()
             ),
           ),

           SizedBox(height: 40,),

           GestureDetector(
             onTap: () async {
               final result = await ApiHelper.logIn(emailController.text, passwordController.text);

               if(result == "success"){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
               }
               else{
                 print("Login not done");
               }
             },
             child: Center(
               child: Text(
                 "Login",style: TextStyle(color: Colors.blue,fontSize: 25),
               ),
             ),
           ),

           SizedBox(height: 25,),
           Row(children: [
             Spacer(),
             InkWell(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen(),));
               },
                 child: Text("Not a Account? Registration Now",style: TextStyle(fontSize: 15),)),

           ]
           ),


         ],
       ),
     ),

   );
  }

}