

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget HistoryButton(double width,double height ,Widget icon ,String title ,
final VoidCallback onpressed
    ){
  return  GestureDetector(
    onTap: onpressed,


    child: Container(
      margin: const EdgeInsets.symmetric(
          horizontal:8.0,
          vertical:12.0,
      ),
      height: height *0.045,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.red.shade700,
        boxShadow: [
          BoxShadow(
            offset: Offset(-1, 3),
            color: Colors.black,
            blurRadius: 3

          )

        ]

      ),
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 5,
          ),
          Text(   title ,
            style:  TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: width * 0.048
            ),
          )
        ],
      ),
    ),
  );


}