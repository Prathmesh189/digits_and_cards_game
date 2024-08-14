
import 'package:flutter/cupertino.dart';

Widget CustomDashboardHeadingText( double width,double height,String text  ){

  return SizedBox(
    child: Text(text,
      style: TextStyle(
        color: CupertinoColors.white,
        fontWeight: FontWeight.bold,
        fontSize: height *0.018,
        letterSpacing: 1
      ),


    ),
  );



}