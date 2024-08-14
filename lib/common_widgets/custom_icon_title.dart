import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CustomIconTitle ( IconData icons ,String title   ){
  return
      Row(
        children: [
          Icon(icons,color: Colors.red,size: 35,  ),
          Text(title  ,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      );


}