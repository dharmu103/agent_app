import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget dialogBox(title, description, buttonText, onPressed) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    child: dialogContent(title, description, buttonText, onPressed),
  );
}

dialogContent(title, description, buttonText, onPressed) {}
