import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void filedFocusChange(
      BuildContext context,
      FocusNode current,
      FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message, backgroundColor: Colors.black, textColor: Colors.white);
  }

  static void flashBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.all(10),
          message: message,
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(10),
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: Icon(Icons.ac_unit),
        )..show(context));
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.blue, content: Text(message)));
  }
}
