import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workerkhojo_agent_panel/getx/auth_controller.dart';
import 'package:workerkhojo_agent_panel/widgets/icons.dart';
import 'package:workerkhojo_agent_panel/widgets/textfield_1_.dart';

import 'edit_profile_screen.dart';

class ViewProfileScreen extends StatelessWidget {
  const ViewProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('View Profile'),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Get.to(const EditProfileScreen());
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          controller: ScrollController(),
          child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('agents')
                  .doc(
                      FirebaseAuth.instance.currentUser!.phoneNumber.toString())
                  .snapshots(),
              builder: (context, snapshot) {
                return Column(children: [
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
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Text('username'),
                        textfield_1(verified('true'), 'navneet', null, null),
                        const SizedBox(height: 20),
                        const Text('email'),
                        textfield_1(null, 'navneet@gmail.com', null, null),
                        const SizedBox(height: 20),
                        const Text('phone'),
                        textfield_1(null, '+91123456789', null, null),
                        const SizedBox(height: 20),
                        const Text('address'),
                        textfield_1(verified('false'), 'A udaipur', null, null),
                        const SizedBox(height: 20),
                        const Text('aadhar Number'),
                        textfield_1(verified('false'), 'A udaipur', null, null),
                        const SizedBox(height: 20),
                        const Text('PAN Number'),
                        textfield_1(verified('false'), 'A udaipur', null, null),
                      ],
                    ),
                  ),
                ]);
              }),
        ));
  }
}
