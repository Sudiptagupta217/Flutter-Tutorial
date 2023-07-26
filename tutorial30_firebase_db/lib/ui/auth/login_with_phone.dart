import 'package:flutter/material.dart';
import 'package:tutorial30_firebase/ui/auth/varify_code.dart';
import 'package:tutorial30_firebase/utils/utils.dart';
import 'package:tutorial30_firebase/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({super.key});

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {

  bool loading = false;
  final auth = FirebaseAuth.instance;
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login with phone"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 50,),

            TextFormField(
            controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "+91 234 373 9222"
              ),
            ),

            SizedBox(height: 85,),

            RoundButton(title: "Login",loading: loading,onTap: (){
              setState(() {
                loading = true;
              });
              auth.verifyPhoneNumber(
                  phoneNumber: phoneNumberController.text,
                  verificationCompleted: (_){},
                  verificationFailed: (a){
                    Utils().toastMessage(a.toString());
                    setState(() {
                      loading=false;
                    });
                  },
                  codeSent: (String verificationId, int? token) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>VerifyCodeScreen(verificationId: verificationId,),));
                  },
                  codeAutoRetrievalTimeout:(e) {
                    Utils().toastMessage(e.toString());
                    setState(() {
                      loading=false;
                    });
                  },
              );
            })

          ],
        ),
      ),
    );
  }
}
