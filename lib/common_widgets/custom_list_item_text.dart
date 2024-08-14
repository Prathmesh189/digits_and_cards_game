



import 'package:flutter/cupertino.dart';

Widget CustomListItemText(

    double width,double height,String text

){

  return SizedBox(
    width: width *0.245,
    child: Text(text,
      style: TextStyle(
          color: CupertinoColors.white,
          fontSize: height *0.028,
          letterSpacing: 1
      ),


    ),
  );



}