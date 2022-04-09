import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workerkhojo_agent_panel/getx/db_controller.dart';
import 'package:workerkhojo_agent_panel/widgets/chip.dart';
import 'package:workerkhojo_agent_panel/widgets/list_tile.dart';

import 'requirement_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dbController = Get.put(DbController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Home'),
      ),
      body: Column(children: [
        SizedBox(
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
          child: FutureBuilder(
              future: getRequire(),
              builder: (context, snapshot) {
                Map<String, dynamic>? data =
                    snapshot.data as Map<String, dynamic>?;
                if (data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data[index]['name']),
                      subtitle: Text(data[index]['status']),
                      trailing: Text(data[index]['applied'] == true
                          ? 'Applied'
                          : 'Not Applied'),
                      onTap: () {},
                    );
                  },
                );
              }),
        ),
      ]),
    );
  }
}

Future<QuerySnapshot<Map<String, dynamic>>> getRequire() async {
  var req = await FirebaseFirestore.instance.collection('requirements').get();

  return req;
}
