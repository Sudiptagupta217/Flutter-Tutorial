import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TobBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Expanded(
      flex: 2,
      child: Container(
        color: Colors.blue,
        child: ListView.builder(itemBuilder: (context, index) =>
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 100,
                  child: CircleAvatar(backgroundColor: Colors.green
                  )
              ),
            ),
          itemCount: 10,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

}