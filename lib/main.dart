import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:workerkhojo_agent_panel/getx/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(AuthController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agent Panel',
      theme: ThemeData(scaffoldBackgroundColor: Colors.indigoAccent[50]),
      home: FutureBuilder(
          future: _controller.isAlreadyLoggedIn(),
          builder: (context, snapshot) {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          }),
    );
  }
}
