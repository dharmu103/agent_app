import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workerkhojo_agent_panel/getx/auth_controller.dart';
import 'package:workerkhojo_agent_panel/screens/profile/view_profile_screen.dart';

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
              Get.to(const ViewProfileScreen());
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
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
