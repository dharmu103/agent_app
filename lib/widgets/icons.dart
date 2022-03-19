import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Icon verified(String verified) {
  if (verified == "true") {
    return const Icon(
      Icons.check_circle,
      color: Colors.green,
    );
  } else {
    return const Icon(
      Icons.error_outline,
      color: Colors.red,
    );
  }
}
