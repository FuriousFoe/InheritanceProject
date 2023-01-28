// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_project/pages/account_detailspage.dart';
import 'package:flutter_project/pages/cart_page.dart';
import 'package:flutter_project/pages/facilities_page.dart';
import 'package:flutter_project/pages/homepage.dart';
import 'package:flutter_project/pages/button_page.dart';
import 'package:flutter_project/pages/loginpage.dart';
import 'package:flutter_project/pages/profile_page.dart';
import 'package:flutter_project/pages/terms_page.dart';
import 'package:flutter_project/utils/routes.dart';
import 'package:flutter_project/widgets/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
   
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MaterialApp(home: const MyApp()));
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
       initialRoute: MyRoutes.profileRoute,
       routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
        MyRoutes.profileRoute:(context) => Frame(),
        MyRoutes.accountRoute:(context) => Frametwo(),
        MyRoutes.facilityRoute:(context) => Facilities(),
        MyRoutes.buttonRoute:(context) => Home(),
        MyRoutes.termsRoute:(context) => Terms(),
        MyRoutes.accountRoute:(context) => Frametwo(),
        MyRoutes.accountRoute:(context) => Frametwo(),
      },
    );
  }
}


