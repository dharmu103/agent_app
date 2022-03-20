import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workerkhojo_agent_panel/getx/db_controller.dart';

import 'add_worker_form.dart';

class MyWorkersScreen extends StatelessWidget {
  const MyWorkersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dbController = Get.put(DbController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('My Workers'),
        ),
        body: SizedBox(
          height: Get.height,
          child: Column(
            children: [
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
                  child: _dbController.workers.isEmpty
                      ? const Center(
                          child: Text('Please Add Workers'),
                        )
                      : GetBuilder<DbController>(builder: (context) {
                          return ListView.builder(
                              itemCount: _dbController.workers.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  trailing: IconButton(
                                      onPressed: () {
                                        _dbController.deleteWorker(_dbController
                                            .workers[index].workerId);
                                      },
                                      icon: const Icon(Icons.delete)),
                                  leading: const Icon(Icons.person),
                                  title: Text(_dbController.workers[index].name
                                      .toString()),
                                  onTap: () {
                                    Get.back();
                                    Get.defaultDialog(
                                        title:
                                            '${_dbController.workers[index].name} info',
                                        content: Text(_dbController
                                            .workers[index].name
                                            .toString()),
                                        actions: []);
                                  },
                                );
                              });
                        }))
            ],
          ),
        ));
  }
}
