import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial27_mvvm/res/components/round_button.dart';
import 'package:tutorial27_mvvm/view_model/auth_view_model.dart';

import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusnode = FocusNode();
  FocusNode passwordFocusnode = FocusNode();

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _obsecurePassword.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusnode.dispose();
    passwordFocusnode.dispose();
  }
  @override
  Widget build(BuildContext context) {

  final authViewModel = Provider.of<AuthViewModel>(context);

    final height= MediaQuery.of(context).size.height*1;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         TextFormField(
           controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          focusNode: emailFocusnode,
          decoration: const InputDecoration(
            hintText: "Email",
            labelText: 'Email',
            prefixIcon: Icon(Icons.alternate_email)
          ),
           onFieldSubmitted: (value) {
             // FocusScope.of(context).requestFocus(passwordFocusnode);
             Utils.filedFocusChange(context, emailFocusnode, passwordFocusnode);
           } ,
         ),

          ValueListenableBuilder(
              valueListenable: _obsecurePassword,
              builder: (context, value, child) {
              return TextFormField(
                controller: _passwordController,
                focusNode: passwordFocusnode,
                obscureText: _obsecurePassword.value,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    hintText: "Password",
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                        onTap: () {
                          _obsecurePassword.value=!_obsecurePassword.value;
                        },
                        child: Icon(
                            _obsecurePassword.value ? Icons.visibility_off_outlined:
                        Icons.visibility
                        ))
                ),
              );

              },),

          SizedBox(height: height*0.1,),
          
          RoundButton(title: "Login",
            loading: authViewModel.loading,
            onPress: () {
            if(_emailController.text.isEmpty){
              Utils.flashBarErrorMessage("Please enter email", context);
            } else if(_passwordController.text.isEmpty){
              Utils.flashBarErrorMessage("Please enter password", context);

            } else if(_passwordController.text.length<6){
              Utils.flashBarErrorMessage("Please enter 6 digit password", context);
            }else{
              Map data ={
                'email':_emailController.text.toString(),
                'password':_passwordController.text.toString(),
              };
              authViewModel.loginApi(data,context);
              print("api hit");
            }


            },
          ),

          SizedBox(height: height*0.2,),

          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.signUp);
            },
              child: Text("Don't have an account? Sign Up")),




        ],
      ),
    );
  }
}
