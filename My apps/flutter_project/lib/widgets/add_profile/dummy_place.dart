import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/add_profile/user.dart';
import 'package:flutter_project/widgets/add_profile/user_preferences.dart';

import '../add_profile/appbar_widget.dart';
import '../add_profile/button_widget.dart';
import '../add_profile/numbers_widget.dart';
import '../add_profile/profile_widget.dart';
import 'editing_profile.dart';

class DummyPage extends StatefulWidget {
  @override
  _DummyPageState createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return Builder(
      builder: (context) => Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 24),
            ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
                setState(() {});
              },
            ),
            const SizedBox(height: 24),
            buildName(user),
            const SizedBox(height: 24),
            Center(child: buildSaveChangesButton()),
            const SizedBox(height: 24),
            NumbersWidget(),
          ],
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildSaveChangesButton() => ButtonWidget(
        text: 'Save All Changes',
        onClicked: () {},
      );
}
