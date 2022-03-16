import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workerkhojo_agent_panel/widgets/textfields.dart';

class ViewProfileScreen extends StatelessWidget {
  const ViewProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('View Profile'),
        ),
        body: Column(children: [
          Stack(
            children: [
              Container(
                height: Get.height * 0.25,
              ),
              Container(
                height: Get.height * 0.15,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              Positioned(
                width: Get.width,
                height: Get.height * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 63,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(height: 10),
                    Text('')
                  ],
                ),
              ),
              Positioned(
                width: Get.width,
                height: Get.height * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 60,
                    ),
                    SizedBox(height: 10),
                    Text('Charli Chapln')
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: Get.height * 0.6,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text('username'),
                textfield(null, 'navneet', null, null),
                SizedBox(height: 20),
                Text('email'),
                textfield(null, 'navneet@gmail.com', null, null),
                SizedBox(height: 20),
                Text('phone'),
                textfield(null, '+91123456789', null, null),
                SizedBox(height: 20),
                Text('address'),
                textfield(null, 'A udaipur', null, null),
              ],
            ),
          ),
        ]));
  }
}
