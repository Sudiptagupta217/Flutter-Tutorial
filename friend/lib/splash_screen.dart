import 'package:flutter/material.dart';
import 'package:friend/screen/login_screen.dart';
import 'package:friend/widgets/cuatom_icon_button.dart';
import 'package:friend/widgets/custom_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String text="It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.";
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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

              //Body
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:  Column(
                  children: [
                    Image.asset("assets/images/splash_img.jpg",width: size.width,height: size.height*0.5,),
                    const Text("Hello!",style: TextStyle(fontSize: 34,fontWeight: FontWeight.w800,fontFamily: "Inter")),
                    const SizedBox(height: 10,),
                    Text(text,textAlign: TextAlign.center, style: TextStyle(fontSize: 15,fontFamily: "Inter", color: Colors.grey.shade600)),


                    const SizedBox(height: 40,),

                    Row(
                      children: [
                        Expanded(
                            flex:1,
                            child: CustomButton(title: "Login",color: Colors.blue,style: TextStyle(color: Colors.white,fontSize: 17), onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                            })),
                        const SizedBox(width: 10,),
                        Expanded(
                            flex:1 ,
                            child: CustomButton(title: "SignUp",style: TextStyle(color: Colors.black,fontSize: 17), onTap: (){})),
                      ],
                    ),

                  ],
                ),
              ),


              const Spacer(),
              //Bottom
              const Column(
                children: [
                  Text("Or via social media",style: TextStyle(fontSize: 15,fontFamily: "Inter"),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconButton(icon: "assets/images/facebook.jpg"),
                      CustomIconButton(icon: "assets/images/google.png"),
                      CustomIconButton(icon: "assets/images/linkedin.webp"),
                      ],
                    )
                ],
              ),
              const Spacer(),

            ],
          ),
        ),
      ),

    );
  }
}
