import 'package:flutter/material.dart';

void showinvalidDigitsSnackbar(BuildContext context, String message ,bool isValid  ) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor:   isValid ? Colors.black  : Colors.green,
      duration: Duration(seconds: isValid ? 5  :2),
      content: Row(
        children: [
          Icon( isValid ? Icons.cancel : Icons.done ,color: Colors.white, ),
          SizedBox(width: 10),
          SizedBox(
            width:MediaQuery.of(context).size.width - 100,
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}