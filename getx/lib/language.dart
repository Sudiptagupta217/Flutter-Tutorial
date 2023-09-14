import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Text("message".tr),
            subtitle: Text("name".tr),
          ),
          SizedBox(height: 20,),
          
          Row(
            children: [
              OutlinedButton(onPressed: (){
                Get.updateLocale(Locale('en','US'));
              }, child: Text("Englisg")),
              OutlinedButton(onPressed: (){
                Get.updateLocale(Locale('hi','IN'));
              }, child: Text("Hindi")),
            ],
          )
          
        ],


      ),
    );
  }
}