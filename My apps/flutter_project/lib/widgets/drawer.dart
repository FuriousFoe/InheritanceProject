import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/utils/routes.dart';

import 'add_profile/profile_widget.dart';
import 'add_profile/profile_widget_drawer.dart';
import 'add_profile/user_preferences.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final user = UserPreferences.getUser();
     
    final imageUrl =
        "https://avatars.githubusercontent.com/u/12619420?s=460&u=26db98cbde1dd34c7c67b85c240505a436b2c36d&v=4";
    return Drawer(
      child: Container(
        color: Colors.blueAccent,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text(user.name),
                accountEmail: Text(user.email),
                currentAccountPicture: ProfileWidgetDrawer(
                  imagePath: user.imagePath,
                  onClicked: () async { },
                ),
                // currentAccountPicture: CircleAvatar(
                //   backgroundImage: FileImage(File(user.imagePath)),
                // ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
               onTap: () {
                Navigator.pushNamed(context, MyRoutes.homeRoute);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
                onTap: () {
                Navigator.pushNamed(context, MyRoutes.profileRoute);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.add_circled,
                color: Colors.white,
              ),
              title: Text(
                "Add Your PG",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
               onTap: () {
                Navigator.pushNamed(context, MyRoutes.addpgRoute);
              },
            ),
              ListTile(
              leading: Icon(
                CupertinoIcons.settings,
                color: Colors.white,
              ),
              title: Text(
                "Settings",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
               onTap: () {
                Navigator.pushNamed(context, MyRoutes.settingsRoute);
              },
            )
          ],
        ),
      ),
    );
  }
}