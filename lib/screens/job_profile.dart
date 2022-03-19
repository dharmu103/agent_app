import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workerkhojo_agent_panel/widgets/btmsheet.dart';
import 'package:workerkhojo_agent_panel/widgets/button.dart';
import 'package:workerkhojo_agent_panel/widgets/icons.dart';

class JobProfileScreen extends StatelessWidget {
  const JobProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    return Scaffold(
        appBar: AppBar(),
        body: Stack(children: [
          Container(
            color: Colors.indigo,
          ),
          Container(
            height: Get.height * 0.3,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Baby Shitter',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: Get.width * 0.05),
                ),
                Text(
                  'Byjusoft',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: Get.width * 0.05,
                      color: Colors.white70),
                ),
                Row(
                  children: [
                    Text(
                      'Navdeep Hudda  ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Get.width * 0.05,
                          color: Colors.white),
                    ),
                    verified('true')
                  ],
                ),
                Text(
                  'Age(25)',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: Get.width * 0.045,
                      color: Colors.white70),
                ),
              ],
            ),
          ),
          Column(children: [
            SizedBox(height: Get.height * 0.2),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                width: Get.width,
                height: Get.height * 0.6,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Text(
                  arguments.toString(),
                ),
              ),
            ),
          ]),
          Positioned(
              bottom: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                width: Get.width,
                child:
                    buildButton(context, 'Apply', Colors.indigo, Get.width, () {
                  Get.bottomSheet(BottomSheet(
                    onClosing: () {},
                    builder: (context) => BuildBottomSheet(),
                  ));
                }),
              ))
        ]));
  }
}
