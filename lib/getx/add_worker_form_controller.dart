import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:workerkhojo_agent_panel/getx/auth_controller.dart';
import 'package:workerkhojo_agent_panel/getx/db_controller.dart';
import 'package:workerkhojo_agent_panel/models/agent_model.dart';
import 'package:workerkhojo_agent_panel/widgets/toast.dart';

class AddWorkerFormController {
  DbController dbController = Get.find();
  final formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;

  TextEditingController nameController = TextEditingController();
  var random = Random().nextInt(1000000);
  final storage = const FlutterSecureStorage();

  // this fuction is called when the agent adds a worker
  addWorker() async {
    var agentId = await storage.read(key: 'agentId');

    if (formKey.currentState!.validate() && agentId.toString().length == 6) {
      _firestore.collection('workers1').doc('wk-$random').set({
        'name': nameController.text,
        'workerId': random.toString(),
        'agentId': agentId.toString(),
      }).then((value) => {
            toast('Worker Added', Colors.green),
            nameController.clear(),
            random = Random().nextInt(1000000),
          });
    }
    Get.back();
  }
}
