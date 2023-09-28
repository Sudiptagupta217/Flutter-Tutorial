import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String icon;

  const CustomIconButton({Key? key, required this.icon, }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0,left: 5,right: 5),
      child: Container(
        child: ClipRRect(borderRadius: BorderRadius.circular(50),
            child: Image.asset(icon,fit: BoxFit.fill, height: 40,width: 40,)),
      ),
    );
  }
}
