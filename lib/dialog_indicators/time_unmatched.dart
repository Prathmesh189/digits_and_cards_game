import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showTimeUnmatchedDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text('Betting has been closed'),
        content: const Text('You can also play with different Bets...'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}



