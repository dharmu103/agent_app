import 'package:flutter/cupertino.dart';

Widget dialogBox(title, description, buttonText, onPressed) {
  return CupertinoAlertDialog(
    title: Text(title),
    content: Text(description),
    actions: <Widget>[
      CupertinoDialogAction(
        child: Text(buttonText),
        onPressed: onPressed,
      ),
    ],
  );
}
