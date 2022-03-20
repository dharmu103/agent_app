import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workerkhojo_agent_panel/getx/db_controller.dart';

class AppliedRequirements extends StatelessWidget {
  const AppliedRequirements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(DbController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Applied Requirements'),
      ),
      body: GetBuilder<DbController>(builder: (controller) {
        return _controller.appliedjobs.isEmpty
            ? const Center(child: Text('No Jobs Applied'))
            : ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.person),
                    title: Text('reqid-${_controller.appliedjobs[index].id}'),
                    subtitle: Text(
                        'agentid-${_controller.appliedjobs[index].appliedBy} Workerid-${_controller.appliedjobs[index].appliedWorkerId} '),
                  );
                },
                itemCount: _controller.appliedjobs.length);
      }),
    );
  }
}
