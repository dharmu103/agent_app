import 'dart:async';

import 'package:get/get.dart';

class OtpTimerController extends GetxController {
  RxInt timer = 60.obs;

  @override
  void onInit() {
    timer = 60.obs;
    timerHandler();

    super.onInit();
  }

  timerHandler() {
    Timer(const Duration(seconds: 1), () {
      if (timer > 0) {
        timer--;
        timerHandler();
      }
    });
  }
}
