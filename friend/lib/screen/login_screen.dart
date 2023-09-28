import 'package:flutter/material.dart';
import 'package:friend/widgets/custom_button.dart';

import '../widgets/cuatom_icon_button.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Column(
              children: [
                //AppBar
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/icon.png",height: 30,width: 30,),
                        const SizedBox(width: 10,),
                        const Text("Sales Top",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w700,fontFamily: "Lato"),)
                      ],
                    ),
                  ),
                ),

                Spacer(),

                Container(
                    width: size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome Back!",style: TextStyle(fontSize: 34,fontWeight: FontWeight.w600,fontFamily: "Lato"),),
                      SizedBox(height: 10,),
                      Text("SignIn to Comtinue",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,fontFamily: "Lato", color: Colors.grey.shade700),)
                    ],
                  ),
                ),

                Spacer(),
                Spacer(),

                Container(
                  width: size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     TextFormField(
                       controller: userNameController,
                       decoration: InputDecoration(
                         label: Text("Username")
                       ),
                     ),
                      const SizedBox(height: 40,),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            label: Text("Password")
                        ),
                      )
                    ],
                  ),
                ),

                const Spacer(),

                CustomButton(title: "Login Now",
                    width: size.width*0.6,
                    color: Colors.blue,
                    style: TextStyle(fontSize: 16,color: Colors.white),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                    }),

                const SizedBox(height: 20,),

                Text("Forgot Password?",style: TextStyle(color: Colors.grey.shade800,fontSize: 17),),

                const Spacer(),

                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIconButton(icon: "assets/images/facebook.jpg"),
                    CustomIconButton(icon: "assets/images/google.png"),
                    CustomIconButton(icon: "assets/images/linkedin.webp"),
                  ],
                ),
                Spacer(),

                RichText(
                  text: TextSpan(
                      style: TextStyle(fontFamily: "Lato", fontWeight: FontWeight.w500,color: Colors.grey.shade700,fontSize: 17),
                      children: [
                        const TextSpan(text: "Don't have an account? "),
                        TextSpan(text: "SignUp", style: TextStyle(fontFamily: "Lato", fontWeight: FontWeight.bold, color: Colors.grey.shade900,fontSize: 17))
                      ]
                  ),
                ),

                const Spacer()


              ],
            ),
          ),
        ),
      ),
    );
  }
}
