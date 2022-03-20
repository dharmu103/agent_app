import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:workerkhojo_agent_panel/models/requirements_model.dart';
import 'package:workerkhojo_agent_panel/models/worker_detail_model.dart';

import '../widgets/toast.dart';

class DbController extends GetxController {
  RxList<RequirementsModel> requirements = <RequirementsModel>[].obs;
  RxList<WorkerModel> workers = <WorkerModel>[].obs;
  RxList<RequirementsModel> appliedjobs = <RequirementsModel>[].obs;

  final _firestore = FirebaseFirestore.instance;

  final storage = const FlutterSecureStorage();

  RxBool isLoading = false.obs;

  RxBool isLoading2 = false.obs;

  @override
  onInit() async {
    await getAllJobs();
    await getAllWorkers();
    await getAllappliedJobs();

    super.onInit();
  }

// this function is getting all the jobs from the firestore database and storing it in the jobs list
  getAllJobs() async {
    isLoading.value = true;
    _firestore
        .collection('requirements1')
        .where('applied', isEqualTo: false)
        .snapshots()
        .listen((value) {
      requirements.clear();
      for (var element in value.docs) {
        requirements.add(RequirementsModel.fromJson(element.data()));
      }
      isLoading.value = false;
      update();
    });
  }

  // this function is getting all the workers from the firestore database and storing it in the workers list
  getAllWorkers() async {
    var agentId = await storage.read(key: 'agentId');
    if (agentId.toString().length == 6) {
      _firestore
          .collection('workers1')
          .where('agentId', isEqualTo: agentId.toString())
          .snapshots()
          .listen((value) {
        workers.clear();
        for (var element in value.docs) {
          workers.add(WorkerModel.fromJson(element.data()));
        }
        update();
      });
    }
  }

// // this function is called when the agents clicks on the apply  button
  void applyJob(docid, agentId, workerId) {
    isLoading.value = true;
    try {
      _firestore.collection('requirements1').doc('req-$docid').update({
        'applied': true,
        'appliedBy': agentId,
        'appliedWorkerId': workerId
      }).then((value) {
        isLoading.value = false;
        toast('Job Applied', Colors.green);
      });
    } catch (e) {
      toast('Something went wrong', Colors.red);
    }
  }

  void deleteWorker(workerId) {
    isLoading2.value = true;
    try {
      _firestore
          .collection('workers1')
          .doc('wk-$workerId')
          .delete()
          .then((value) {
        isLoading2.value = false;
        toast('Worker Deleted', Colors.green);
      });
    } catch (e) {
      toast('Something went wrong', Colors.red);
    }
  }

  getAllappliedJobs() async {
    isLoading.value = true;
    var agentId = await storage.read(key: 'agentId');

    if (agentId != null) {
      _firestore
          .collection('requirements1')
          .where(
            'appliedBy',
            isEqualTo: agentId,
          )
          .snapshots()
          .listen((value) {
        appliedjobs.clear();
        for (var element in value.docs) {
          appliedjobs.add(RequirementsModel.fromJson(element.data()));
        }
        print(appliedjobs.length.toString());
        update();
      });
    }
  }
}
