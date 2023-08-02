import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/widgets/add_profile/dummy_place.dart';
import 'package:flutter_project/widgets/add_profile/profile_page.dart';
import 'package:flutter_project/widgets/add_profile/user_preferences.dart';
import 'package:flutter_project/widgets/add_profile/themes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_project/pages/account_detailspage.dart';
import 'package:flutter_project/pages/authentication_page.dart';
import 'package:flutter_project/pages/cart_page.dart';
import 'package:flutter_project/pages/dynamic_page.dart';
import 'package:flutter_project/pages/facilities_page.dart';
import 'package:flutter_project/pages/homedetailspage.dart';
import 'package:flutter_project/pages/homepage.dart';
import 'package:flutter_project/pages/button_page.dart';
import 'package:flutter_project/pages/listpage.dart';
import 'package:flutter_project/pages/loginpage.dart';
import 'package:flutter_project/pages/profile.dart';
import 'package:flutter_project/pages/settings.dart';
import 'package:flutter_project/pages/room_detailspage.dart';
import 'package:flutter_project/pages/terms_page.dart';
import 'package:flutter_project/provider/google_sign_in.dart';
import 'package:flutter_project/utils/routes.dart';
import 'package:flutter_project/widgets/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project/pages/maps/google_map_api.dart';
import 'package:provider/provider.dart';

Future main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await UserPreferences.init();

  runApp( MaterialApp(home: const MyApp()));
  }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
   Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
           themeMode: ThemeMode.system,
           theme: MyTheme.lightTheme(context),
          //theme: ThemeProvider.themeOf(context),
          initialRoute: MyRoutes.homeRoute,
          routes: {
            "/": (context) => LoginPage(),
               MyRoutes.homeRoute: (context) => HomePage(),
              MyRoutes.loginRoute: (context) => LoginPage(),
              MyRoutes.cartRoute: (context) => CartPage(),
              MyRoutes.settingsRoute:(context) => Frame(),
              MyRoutes.accountRoute:(context) => Frametwo(),
              MyRoutes.facilityRoute:(context) => Facilities(),
              MyRoutes.buttonRoute:(context) => Home(),
              MyRoutes.termsRoute:(context) => Terms(),
              MyRoutes.accountRoute:(context) => Frametwo(),
              MyRoutes.roomRoute:(context) => RoomDetails(),
              MyRoutes.mapRoute: (context) => GoogleMapAPI(),
              MyRoutes.authRoute:(context) => AuthPage() , 
              MyRoutes.profileRoute:(context) => DummyPage(),
              MyRoutes.dynamicRoute:(context) => Dropdown(),
              MyRoutes.listRoute:(context) => listpage() 
          },
        ),
      );
  }

  // Widget build(BuildContext context) => ChangeNotifierProvider(
  //     create: (context) => GoogleSignInProvider() , 
      
  //     child: Builder(
  //       builder: (context) {
  //         return MaterialApp(
  //         themeMode: ThemeMode.system,
  //            theme: MyTheme.lightTheme(context),
  //            darkTheme: MyTheme.darkTheme(context),
  //            debugShowCheckedModeBanner: false,
  //            initialRoute: MyRoutes.settingsRoute, 
  //            routes: {
  //             "/": (context) => LoginPage(),
  //             MyRoutes.homeRoute: (context) => HomePage(),
  //             MyRoutes.loginRoute: (context) => LoginPage(),
  //             MyRoutes.cartRoute: (context) => CartPage(),
  //             MyRoutes.settingsRoute:(context) => Frame(),
  //             MyRoutes.accountRoute:(context) => Frametwo(),
  //             MyRoutes.facilityRoute:(context) => Facilities(),
  //             MyRoutes.buttonRoute:(context) => Home(),
  //             MyRoutes.termsRoute:(context) => Terms(),
  //             MyRoutes.accountRoute:(context) => Frametwo(),
  //             MyRoutes.roomRoute:(context) => RoomDetails(),
  //             MyRoutes.mapRoute: (context) => GoogleMapAPI(),
  //             MyRoutes.authRoute:(context) => AuthPage() , 
  //             MyRoutes.profileRoute:(context) => Profile(),
  //             MyRoutes.dynamicRoute:(context) => Dropdown(),

  //             MyRoutes.listRoute:(context) => listpage() 
  //           },
  //         );
  //       }
  //     ),
  //   );
  
}
