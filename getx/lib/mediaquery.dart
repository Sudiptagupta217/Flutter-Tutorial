import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MediaQueryPage extends StatefulWidget {
  const MediaQueryPage({super.key});

  @override
  State<MediaQueryPage> createState() => _MediaQueryPageState();
}

class _MediaQueryPageState extends State<MediaQueryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home")),
        body: Container(
          //height: MediaQuery.of(context).size.height,
          height: Get.height*0.5,
          width: Get.width,
          color: Colors.blue,
          child: Center(
              child: Text("Hello")),
        ));
  }
}
