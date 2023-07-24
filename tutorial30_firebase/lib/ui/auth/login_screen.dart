import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutorial30_firebase/ui/auth/signup_screen.dart';
import 'package:tutorial30_firebase/widgets/round_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar:AppBar(
          automaticallyImplyLeading: false,
            title: Text("Login")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

         Form(
           key: _formKey,
           child: Column(
             children: [
               TextFormField(
                 keyboardType: TextInputType.emailAddress,
                 controller: emailController,
                 decoration: const InputDecoration(
                     hintText: 'Email',
                     prefixIcon: Icon(Icons.alternate_email)
                 ),
                 validator: (value){
                   if(value!.isEmpty){
                     return 'Enter email';
                   }
                   return null;
                 },
               ),

               SizedBox(height: 20,),

               TextFormField(
                 controller: passwordController,
                 obscureText: true,
                 decoration: const InputDecoration(
                     hintText: 'Password',
                     prefixIcon: Icon(Icons.password)
                 ),
                 validator: (value){
                   if(value!.isEmpty){
                     return 'Enter password';
                   }
                   return null;
                 },
               ),

             ],
           ),

         ),


            SizedBox(height: 50,),

            RoundButton(
                title: "Login",
              onTap: (){
                  if(_formKey.currentState!.validate()){

                  }
              },
            ),

              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                  }, child: Text("Sign Up"))
                ],
              )
          ],),
        )
      ),
    );
  }
}