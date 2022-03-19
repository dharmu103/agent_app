import 'package:get/get.dart';

class BtmNavController extends GetxController {
  int selectedIndex = 0;

  void setSelectedIndex(int index) {
    selectedIndex = index;
    update();
  }
}
