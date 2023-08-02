import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/add_profile/user_preferences.dart';
import 'package:flutter_project/widgets/add_profile/themes.dart';

AppBar buildAppBar(BuildContext context) {
  final icon = CupertinoIcons.moon_stars;
  final user = UserPreferences.getUser();
  final isDarkMode = user.isDarKMode;

  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.blue,
    elevation: 10,
    actions: [
      ThemeSwitcher(
        builder: (context) => IconButton(
          icon: Icon(icon),
          onPressed: () {
            final theme = isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;
            final switcher = ThemeSwitcher.of(context);
            switcher.changeTheme(theme: theme);
            final newUser = user.copy(isDarKMode: !isDarkMode);

            UserPreferences.setUser(newUser);
          },
        ),
      ),
    ],
  );
}
