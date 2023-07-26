import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tutorial30_firebase/ui/posts/post_screen.dart';
import 'package:tutorial30_firebase/utils/utils.dart';

import '../../widgets/round_button.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String verificationId;

  VerifyCodeScreen({Key? key, required this.verificationId}):super(key:key);


  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final verifycodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 50,),

            TextFormField(
              controller: verifycodeController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: "6 digit code"
              ),
            ),

            SizedBox(height: 85,),

            RoundButton(title: "Verify",loading: loading,onTap: () async{

              final credential = PhoneAuthProvider.credential(
                  verificationId: widget.verificationId,
                  smsCode: verifycodeController.text.toString()
              );
              setState(() {
                loading =true;
              });
              try{
                await auth.signInWithCredential(credential);
                Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen(),));
                setState(() {
                  loading =false;
                });
              } catch(e){
                setState(() {
                  loading =false;
                });
                Utils().toastMessage(e.toString());
              }

            })

          ],
        ),
      ),
    );
  }
}
