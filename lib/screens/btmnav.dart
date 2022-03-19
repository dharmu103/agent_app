import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workerkhojo_agent_panel/getx/btmnav_controller.dart';
import 'package:workerkhojo_agent_panel/screens/requirement_detail_screen.dart';

import 'drawer_screen.dart';
import 'home_screen.dart';
import 'profile/view_profile_screen.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _btmnavController = Get.put(BtmNavController());
    List screen = [
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const ViewProfileScreen(),
    ];
    return Scaffold(
      drawer: drawerScreen(),
      bottomNavigationBar: GetBuilder<BtmNavController>(builder: (context) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.blue,
          unselectedItemColor: Colors.blue[200],
          currentIndex: _btmnavController.selectedIndex,
          onTap: (index) => _btmnavController.setSelectedIndex(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Workers',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        );
      }),
      body: GetBuilder<BtmNavController>(
          init: BtmNavController(),
          builder: (_) => screen[_btmnavController.selectedIndex]),
    );
  }
}
