import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void loadingDialog(BuildContext context ,String text  ) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return  CupertinoAlertDialog(
        title: Column(
          children: [
            Text(text,
            style: TextStyle(
              fontSize: 21,
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
            ),

            SizedBox(
              height: 10,
            ),

            const Text("Please wait for while!" ,

              style: TextStyle(
                  color: Colors.grey,
              ),

            ),

          ],
        ),

        content: Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: CupertinoActivityIndicator(radius: 15),
        ),
      );
    },
  );
}
