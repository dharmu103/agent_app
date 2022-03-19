import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget chip(lable) => Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Chip(
        label: Text(lable),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      ),
    );

Widget chip1(lable) => Padding(
      padding: const EdgeInsets.only(right: 28, bottom: 10),
      child: Chip(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        backgroundColor: Colors.indigo[50],
        elevation: 0,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        avatar: Icon(
          Icons.home,
          size: Get.width * 0.05,
          color: Colors.indigo[200],
        ),
        label: Text(
          lable,
          style: TextStyle(fontSize: Get.width * 0.025),
        ),
        visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
