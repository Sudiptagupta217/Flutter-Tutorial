import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String btnName;
  final Icon? icon;
  final Color? bgColor;
  final TextStyle? textStyle;
  final VoidCallback? callback;

  RoundButton({required this.btnName,
    this.icon,
    this.bgColor = Colors.blue,
    this.textStyle,
    this.callback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback!();
      },
      child: icon != null ?
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        icon!,
        Text(btnName, style: textStyle,)
      ],)
          : Text(btnName, style: textStyle),
      style:ElevatedButton.styleFrom(
        primary: bgColor,
      shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
    ),
    );
  }
}
