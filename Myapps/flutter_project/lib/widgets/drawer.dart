import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://avatars.githubusercontent.com/u/12619420?s=460&u=26db98cbde1dd34c7c67b85c240505a436b2c36d&v=4";
    return Drawer(
      child: Container(
        color: Colors.white30, // Set background color to white
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.blue[200], // Header background color
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blue[200]),
                margin: EdgeInsets.zero,
                accountName: const Text(
                  "Pawan Kumar",
                  style: TextStyle(
                      color: Colors.black38, // Account name text color
                      fontSize: 18),
                ),
                accountEmail: const Text(
                  "mtechviral@gmail.com",
                  style: TextStyle(
                    color: Colors.black38, // Account email text color
                    fontSize: 12,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.home,
                color: Color.fromARGB(255, 143, 180, 209), // Icon color
              ),
              title: const Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Color.fromARGB(255, 62, 86, 105), // Text color
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.homeRoute);
              },
            ),
            const Divider(
              thickness: 2,
              indent: 10,
              endIndent: 30,
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.profile_circled,
                color: Color.fromARGB(255, 143, 180, 209), // Icon color
              ),
              title: const Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Color.fromARGB(255, 62, 86, 105), // Text color
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.profileRoute);
              },
            ),
            const Divider(
              thickness: 2,
              indent: 10,
              endIndent: 30,
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.add_circled,
                color: Color.fromARGB(255, 143, 180, 209), // Icon color
              ),
              title: const Text(
                "Add Your PG",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Color.fromARGB(255, 62, 86, 105), // Text color
                ),
              ),
            ),
            const Divider(
              thickness: 2,
              indent: 10,
              endIndent: 30,
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.settings,
                color: Color.fromARGB(255, 143, 180, 209), // Icon color
              ),
              title: const Text(
                "Settings",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Color.fromARGB(255, 62, 86, 105), // Text color
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.settingsRoute);
              },
            ),
            const Divider(
              thickness: 2,
              indent: 10,
              endIndent: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Implement button functionality here
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[400], // Button background color
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                ),
                icon: const Icon(
                  CupertinoIcons.arrow_left_circle_fill, // Icon for the button
                  color: Colors.white, // Icon color
                ),
                label: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white, // Button text color
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
