import 'package:firebase_auth/firebase_auth.dart';

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorial30_firebase/ui/posts/post_screen.dart';

import '../firestore/firestore_list_screen.dart';
import '../ui/auth/login_screen.dart';

class SplashServices{

  void isLogin(BuildContext context){

    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;



 if(user!= null){
   //Timer(const Duration(seconds: 3), () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>PostScreen()))
   Timer(const Duration(seconds: 3), () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>FireStoreScreen()))
   );
   }
 else{
   Timer(const Duration(seconds: 3),
           () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()))
   );}
  }



}