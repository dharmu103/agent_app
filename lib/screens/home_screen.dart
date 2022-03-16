import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workerkhojo_agent_panel/getx/auth_controller.dart';
import 'package:workerkhojo_agent_panel/screens/drawer_screen.dart';
import 'package:workerkhojo_agent_panel/widgets/button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<AuthController>();
    return Scaffold(
      drawer: drawerScreen(),
      appBar: AppBar(
        elevation: 0,
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to the home screen'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
