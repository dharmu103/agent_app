import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  RxInt nextPageIndex = 0.obs;
  List info = [
    {
      'title': 'Join Our Growing Community ',
      'description': 'Join our community and achieve your financial goles ',
    },
    {
      'title': 'Work From AnyWhere',
      'description': 'Enjoy our app and enjoy our exclusive content'
    },
    {
      'title': 'Earn from your Network',
      'description': "Earn flat 10% of your friend's earning from your network"
    }
  ];
  final pcontroller = PageController();
  nextPage() {
    pcontroller
        .nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.ease)
        .then((value) => {nextPageIndex < 2 ? nextPageIndex++ : nextPageIndex});
  }

  priviousPage() {
    pcontroller
        .previousPage(
            duration: const Duration(milliseconds: 300), curve: Curves.ease)
        .then((value) => {nextPageIndex > 0 ? nextPageIndex-- : nextPageIndex});
  }

  @override
  void onClose() {
    pcontroller.dispose();
    super.onClose();
  }
}
