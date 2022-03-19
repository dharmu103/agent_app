import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:workerkhojo_agent_panel/models/job_model.dart';
import 'package:workerkhojo_agent_panel/models/worker_detail_model.dart';

class DbController extends GetxController {
  RxList<JobModel> jobs = <JobModel>[].obs;
  RxList<WorkerModel> workers = <WorkerModel>[].obs;
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  RxBool isLoading = false.obs;

  RxBool isLoading2 = false.obs;

  RxBool isLoading3 = false.obs;

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
    await _firestore.collection('requirements1').get().then((value) {
      for (var element in value.docs) {
        jobs.add(JobModel.fromJson(element.data()));
        print(jobs.length.toString());
        print('object');
      }
      isLoading.value = false;
    });
  }

  // this function is getting all the workers from the firestore database and storing it in the workers list
  getAllWorkers() {
    isLoading2.value = true;
    _firestore
        .collection('workers1')
        .where('agentId', isEqualTo: _auth.currentUser?.phoneNumber.toString())
        .snapshots()
        .listen((value) {
      workers.clear();
      for (var element in value.docs) {
        workers.add(WorkerModel.fromJson(element.data()));
      }
    });
  }

// // this function is called when the agents clicks on the apply  button
  applyJob(JobModel job) async {
    isLoading2.value = true;
    await _firestore.collection('requirements1').doc(job.id).update({
      'applied': true,
      'appliedBy': FirebaseAuth.instance.currentUser?.phoneNumber
    }).then((value) {});
    isLoading2.value = false;
  }
}
