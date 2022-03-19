import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workerkhojo_agent_panel/getx/db_controller.dart';
import 'package:workerkhojo_agent_panel/widgets/dialog_box.dart';

import '../screens/add_worker_form.dart';

class BuildBottomSheet extends StatelessWidget {
  const BuildBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dbController = Get.put(DbController());
    return BottomSheet(
        onClosing: () {},
        builder: (
          context,
        ) =>
            Container(
              height: Get.height * 0.5,
              child: Column(
                children: [
                  const Text('Add Worker or Select from List'),
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add Worker'),
                    onTap: () {
                      Get.back();
                      Get.to(const AddWorkerForm());
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: _dbController.workers.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: const Icon(Icons.person),
                              title: Text(
                                  _dbController.workers[index].name.toString()),
                              onTap: () {
                                Get.back();
                                Get.defaultDialog(
                                    title:
                                        '${_dbController.workers[index].name} is selected \n Do you Want to Apply For this Job?',
                                    content: Text(_dbController
                                        .workers[index].name
                                        .toString()),
                                    actions: [
                                      ElevatedButton(
                                        child: const Text('Cancel'),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                      ElevatedButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      )
                                    ]);
                              },
                            );
                          }))
                ],
              ),
            ));
  }
}
