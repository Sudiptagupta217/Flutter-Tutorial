import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
 final String title;
 Color? color;
 double? width;
 final VoidCallback onTap;
 final bool loading ;
 TextStyle? style;

   CustomButton({super.key,
    required this.title,
     this.width,
    this.style,
     this.color= Colors.white,
    required this.onTap,
     this.loading=false
  }
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: .1,
              offset: Offset(0, 0.5),
            ),]
        ),
        child: Center(child: loading ?CircularProgressIndicator(color: Colors.white,):
        Text(title, style: style)),
      ),
    );
  }
}
