import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/widgets/add_profile/dummy_place.dart';
import 'package:flutter_project/widgets/add_profile/profile_page.dart';
import 'package:flutter_project/widgets/add_profile/user_preferences.dart';
import 'package:flutter_project/widgets/add_profile/themes.dart';
//import 'package:theme_provider/theme_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await UserPreferences.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'User Profile';

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return ThemeProvider(
      initTheme: user.isDarKMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme: ThemeProvider.themeOf(context),
          title: title,
          initialRoute: "/",
          routes: {
            "/": (context) => DummyPage(),
          },
        ),
      ),
    );
  }
}
