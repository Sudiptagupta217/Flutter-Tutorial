

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:tutorial27_mvvm/repository/auth_repository.dart';
import 'package:tutorial27_mvvm/utils/routes/routes_name.dart';
import 'package:tutorial27_mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier{

  final _myRapo = AuthRepository();

  bool _loading =false;
  bool get loading => _loading;

  bool _signuploading =false;
  bool get signUpLoading =>_signuploading;


  setLoading(bool value){
    _loading= value;
    notifyListeners();
  }

  setSignUpLoading(bool value){
    _signuploading= value;
    notifyListeners();
  }

  Future<void>loginApi(dynamic data, BuildContext context) async{
    setLoading(true);
    _myRapo.loginApi(data).then((value) {
     setLoading(false);
      Utils.flashBarErrorMessage("Login Successfully", context);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace){
      setLoading(false);
      if(kDebugMode) {
       Utils.flashBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }


  Future<void>signUpApi(dynamic data, BuildContext context) async{
    setSignUpLoading(true);
    _myRapo.loginApi(data).then((value) {
     setSignUpLoading(false);
      Utils.flashBarErrorMessage("SignUp Successfully", context);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace){
      setSignUpLoading(false);
      if(kDebugMode) {
       Utils.flashBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }


}