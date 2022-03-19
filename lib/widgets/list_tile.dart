import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workerkhojo_agent_panel/widgets/button.dart';
import 'package:workerkhojo_agent_panel/widgets/chip.dart';

Widget listTile(context) => Card(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Insurence Sales Executive',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '\u{20B9}15000- \u{20B9}20000',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Earth Protection Agency',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: Get.width * 0.03),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [chip1('lable'), chip1('lable')],
            ),
            Row(
              children: [chip1('lable'), chip1('lable')],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                buildButton(
                    context, 'Apply', Colors.blue, Get.width * 0.3, () {}),
                iconButton(
                    context, const Icon(Icons.share), Colors.green, () {})
              ],
            )
          ],
        ),
      ),
    );
