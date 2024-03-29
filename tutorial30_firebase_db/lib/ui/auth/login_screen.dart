import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutorial30_firebase/ui/auth/login_with_phone.dart';
import 'package:tutorial30_firebase/ui/auth/signup_screen.dart';
import 'package:tutorial30_firebase/ui/posts/post_screen.dart';
import 'package:tutorial30_firebase/utils/utils.dart';
import 'package:tutorial30_firebase/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  bool loading = false;

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance ;





  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login(){
    setState(() {
      loading = true;
    });
    _auth.signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString()).then((value) {
         Utils().toastMessage(value.user!.email.toString());
         Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen(),));
         setState(() {
           loading=false;
         });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
      setState(() {
        loading=false;
      });
    });
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
             loading: loading,
                title: "Login",
              onTap: (){
                  if(_formKey.currentState!.validate()){
                    login();

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
              ),

              const SizedBox(height: 30,),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) => LoginWithPhone(),));
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width*80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.deepPurple),
                  ),
                  child: Center(
                    child: Text("Login with Phone",style: TextStyle(fontSize: 20,color: Colors.deepPurple),),
                  ),
                ),
              )

          ],),
        )
      ),
    );
  }
}