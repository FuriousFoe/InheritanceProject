import 'package:flutter/material.dart';
import 'package:flutter_project/pages/cart_page.dart';
import 'package:flutter_project/pages/homepage.dart';
import 'package:flutter_project/pages/loginpage.dart';
import 'package:flutter_project/pages/profile_page.dart';
import 'package:flutter_project/utils/routes.dart';
import 'package:flutter_project/widgets/themes.dart';
import 'package:flutter_project/pages/maps/google_map_api.dart';

void main() {
  runApp(MaterialApp(home: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
        MyRoutes.profileRoute: (context) => Frame(),
        MyRoutes.mapRoute: (context) => GoogleMapAPI()
      },
    );
  }
}
