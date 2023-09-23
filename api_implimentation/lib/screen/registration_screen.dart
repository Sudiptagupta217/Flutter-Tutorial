import 'package:api_implimentation/screen/login_screen.dart';
import 'package:api_implimentation/services/api_helper.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_RegistrationScreenState();

}

class _RegistrationScreenState extends State<RegistrationScreen>{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Registration Screen"),
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
               onTap: ()async{
                 final result = await ApiHelper.SignUp(emailController.text, passwordController.text);

                 if(result=="success") {
                   Navigator.push(context, MaterialPageRoute(
                     builder: (context) => LoginScreen(),));
                 }
                 else{
                   print("Registration Not Done! please try again");
                 }
               },
              child: Center(
                child: Text(
                  "SignUp",style: TextStyle(color: Colors.blue,fontSize: 25),
                ),
              ),
            ),

            SizedBox(height: 25,),
            Row(children: [
              Spacer(),
              InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));

                  },
                  child: Text("Already have an Account? Login Now",style: TextStyle(fontSize: 15),)),

            ]
            ),


          ],
        ),
      ),

    );
  }

}