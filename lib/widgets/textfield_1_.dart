import 'package:flutter/material.dart';

Widget textfield_1(icon, hint, textcontroller, validatorFunction) =>
    TextFormField(
      controller: textcontroller,
      style: const TextStyle(fontWeight: FontWeight.w400),
      validator: validatorFunction,
      decoration: InputDecoration(
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          filled: true,
          fillColor: Colors.indigo[50],
          border: const UnderlineInputBorder(),
          hintText: hint,
          prefixIcon: Icon(icon)),
    );
