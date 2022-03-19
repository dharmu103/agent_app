import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workerkhojo_agent_panel/getx/add_worker_form_controller.dart';
import 'package:workerkhojo_agent_panel/widgets/button.dart';
import 'package:workerkhojo_agent_panel/widgets/textfields.dart';

class AddWorkerForm extends StatelessWidget {
  const AddWorkerForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(AddWorkerFormController());
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          key: _controller.formKey,
          child: Column(children: [
            textfield(
                Icons.pages, 'Worker Name', _controller.nameController, null),
            SizedBox(height: Get.height * 0.2),
            buildButton(context, 'Add', Colors.indigo, Get.width, () {
              _controller.addWorker();
            }),
          ])),
    );
  }
}
