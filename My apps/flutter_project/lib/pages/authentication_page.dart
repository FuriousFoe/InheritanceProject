import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/pages/loginpage.dart';
import 'package:flutter_project/provider/google_sign_in.dart';
import 'package:flutter_project/utils/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon( 
              style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Color.fromARGB(255, 66, 22, 22),
                              minimumSize: Size(double.infinity , 50),
                            ),
                icon: FaIcon(FontAwesomeIcons.google , color: Colors.black),
                label: Text('Sign up with google'),
              onPressed: () {
               final provider = Provider.of<GoogleSignInProvider>(context , listen: false) ;
                provider.googleLogin() ;
              },
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );  
              },
              child: const Text(
                'Already have an account? Click here',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
