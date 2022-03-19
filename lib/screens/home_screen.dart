import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workerkhojo_agent_panel/getx/auth_controller.dart';
import 'package:workerkhojo_agent_panel/getx/db_controller.dart';
import 'package:workerkhojo_agent_panel/widgets/chip.dart';
import 'package:workerkhojo_agent_panel/widgets/list_tile.dart';

import 'job_profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<AuthController>();
    final _dbController = Get.put(DbController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            child: ListView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                chip('All'),
                chip('Part Time'),
                chip('Full Time'),
                chip('Online')
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<DbController>(builder: (context) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: _dbController.jobs.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Get.to(const JobProfileScreen(), arguments: index);
                        },
                        child: listTile(context));
                  });
            }),
          )
        ],
      ),
    );
  }
}
