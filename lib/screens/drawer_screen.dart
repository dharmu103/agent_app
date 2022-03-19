import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workerkhojo_agent_panel/getx/auth_controller.dart';

import '../getx/btmnav_controller.dart';
import 'my_workers.dart';

Widget drawerScreen() => Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: Image.network(
                  'https://www.pinclipart.com/picdir/big/541-5416602_dummy-profile-image-url-clipart.png',
                ).image,
              ),
              const Text('User Name'),
            ]),
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              BtmNavController().setSelectedIndex(0);

              Get.back();
            },
          ),
          ListTile(
            title: const Text('My Workers'),
            onTap: () {
              Get.to(const MyWorkersScreen());
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              AuthController().logout();
            },
          ),
        ],
      ),
    );
