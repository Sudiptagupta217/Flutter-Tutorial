import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({super.key});

  @override
  State<ImageUploadScreen> createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {

  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future getImage()async{
    final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,imageQuality: 80);

    if(pickedFile!=null){
      image = File(pickedFile.path);
      setState(() {

      });
    }else{
      print("no image selected");
    }

  }

Future<void> uploadImage() async{
    setState(() {
      showSpinner =true;
    });
var streem = new http.ByteStream(image!.openRead());
streem.cast();

var length = await image!.length();

var uri = Uri.parse("");

var request = new http.MultipartRequest('post', uri);

request.fields['title']="static title";

var multipot = new http.MultipartFile(
    'image',
    streem,
    length);

request.files.add(multipot);
var response = await request.send();

if(response.statusCode==200){
  setState(() {
    showSpinner=false;
  });
  print("image uploaded");
}else {
  setState(() {
    showSpinner=false;
  });
  print('fsailed');
}
}



  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(title: Text("Image Upload")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
           GestureDetector(
             onTap: () {
               getImage();
             },
             child: Container(
               child: image==null ? Center(child: Text("Pick Image"),)
                   :
                   Container(
                     child: Center(
                       child: Image.file(
                          File(image!.path).absolute,
                         height: 100,
                         width: 100,
                         fit:BoxFit.cover,
                       ),

                     ),
                   ),
             ),
           ),
            SizedBox(height: 150,),
            GestureDetector(
              onTap: () {
                uploadImage();
              },
              child: Container(
                height: 50,
                child: Text("Upload"),
              ),
            )

        ]),

      ),
    );
  }
}
