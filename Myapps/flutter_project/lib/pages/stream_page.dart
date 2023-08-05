import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/pages/authentication_page.dart';
import 'package:flutter_project/pages/homepage.dart';
import 'package:flutter_project/pages/loginpage.dart';
import 'package:flutter_project/utils/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class Stream extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
          return HomePage();
          } else if (snapshot.hasError) {
          return Center (child: Text('Something Went Wrong!'));
          } else {
          return LoginPage();
          }
        },  
        ),
    );
}
