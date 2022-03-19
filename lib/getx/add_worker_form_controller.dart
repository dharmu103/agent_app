import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workerkhojo_agent_panel/widgets/toast.dart';

class AddWorkerFormController {
  final formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();

  void addWorker() {
    if (formKey.currentState!.validate()) {
      _firestore.collection('workers').add({
        'name': nameController.text,
        'agentId': _auth.currentUser?.phoneNumber.toString()
      }).then((value) => {
            toast('Worker Added', Colors.green),
            nameController.clear(),
          });
    }
  }
}
