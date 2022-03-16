import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

Future<bool?> toast(msg, color) => Fluttertoast.showToast(
    msg: msg.toString(),
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0);
