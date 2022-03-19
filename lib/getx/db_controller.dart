import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:workerkhojo_agent_panel/models/requirements_model.dart';
import 'package:workerkhojo_agent_panel/models/worker_detail_model.dart';

class DbController extends GetxController {
  RxList<RequirementsModel> requirements = <RequirementsModel>[].obs;
  RxList<WorkerModel> workers = <WorkerModel>[].obs;

  final _firestore = FirebaseFirestore.instance;

  final storage = const FlutterSecureStorage();

  RxBool isLoading = false.obs;

  RxBool isLoading2 = false.obs;

  @override
  onInit() async {
    await getAllJobs();
    await getAllWorkers();
    update();
    super.onInit();
  }

// this function is getting all the jobs from the firestore database and storing it in the jobs list
  getAllJobs() async {
    isLoading.value = true;
    await _firestore
        .collection('requirements1')
        .where('applied', isEqualTo: false)
        .get()
        .then((value) {
      for (var element in value.docs) {
        requirements.add(RequirementsModel.fromJson(element.data()));
      }
      isLoading.value = false;
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
      });
    }

// // this function is called when the agents clicks on the apply  button
  }
}
