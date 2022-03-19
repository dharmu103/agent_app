import 'package:flutter/material.dart';

Widget buildButton(context, text, color, width, onpressed) => SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: color),
        onPressed: onpressed,
        child: Text(
          text,
        ),
      ),
    );
Widget iconButton(context, icon, color, onpressed) => SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.2,
      child: TextButton(onPressed: onpressed, child: icon),
    );
