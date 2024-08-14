import 'package:flutter/material.dart';

Widget CustomGameAdded(
  String session,
  String points,
  String digits,
  double width,
  double height,
) {
  return Container(
      height: 44,
      width: width * 0.95,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Spacer(),
            SizedBox(
              width: width * 0.33,
              child: Text(
                session,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: height * 0.020,
                    letterSpacing: 1),
              ),
            ),
            Spacer(),
            SizedBox(
              width: width * 0.23,
              child: Text(
                digits,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.024),
              ),
            ),
            Spacer(),
            SizedBox(
              width: width * 0.23,
              child: Text(
                points,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.024,
                    letterSpacing: 1),
              ),
            ),
            Spacer(),
          ],
        ),
      ));
}