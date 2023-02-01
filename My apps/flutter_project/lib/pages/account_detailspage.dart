// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import 'package:flutter_project/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Frametwo extends StatefulWidget {
  const Frametwo({Key? key}) : super(key: key);

  @override
  State<Frametwo> createState() => _FrametwoState();
}

class _FrametwoState extends State<Frametwo> {
String name = "";
String email = "";
String num  = "";
String add = "";

bool changeButton = false;
final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        changeButton = false;
      });
    }
  }
  addData (){
   
    Map<String,dynamic> demoData = {"Name" : name , "Email id": email , "Phone no": num , "Address" : add } ; 
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('data') ;
    collectionReference.add(demoData) ; 
  }

  @override
  Widget build(BuildContext context) {
       return Scaffold(
        appBar: AppBar(
        title: Text("Aapke details" ,
         style:TextStyle(color: Colors.black , fontSize: 20)),
      ),
      //  color: context.canvasColor,
      body: Material(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                 SizedBox(
                  height: 20.0,
                ), 
                 Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                 children: <Widget>[
                    Text(
                     "Account details :",
                      style: TextStyle(
                       fontWeight: FontWeight.bold, 
                       
                       fontSize: 25,
                    ),
                  ),
                ],
              ),
           ),
              /*  SizedBox(
                  height: 20.0,
                ),  */
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 30.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Name",
                          labelText: "Name ",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "abcde@123.outlook.com",
                          labelText: "Email-id:",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length == 5) {
                            return "Password length should be atleast 6";
                          }
                          return null;
                        },
                         onChanged: (value) {
                          email = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                       // obscureText: true,
                        decoration: InputDecoration(
                          hintText: "123456789",
                          labelText: "Phone Number",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field cannot be empty";
                          } else if (value.length <= 9) {
                            return "Field length should be 10";
                          }
                          return null;
                        },
                         onChanged: (value) {
                          num = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                       // obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Jhut wala mat daaloo ",
                          labelText: "Residential Address",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field cannot be empty";
                          } else if (value.length <= 9) {
                            return "Field length should be 10 & contain Pin Code";
                          }
                          return null;
                        },
                         onChanged: (value) {
                          add = value;
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      MaterialButton(
                        color: context.theme.buttonColor,
                       // borderRadius:  BorderRadius.circular(changeButton ? 50 : 8),
                       minWidth: double.maxFinite,
                       height: 50,
                        onPressed: addData ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(width: 10),
                            Text("Submit" ,
                            style:TextStyle(color: Colors.white , fontSize: 20)),
                          ],
                        ),
                        textColor: Colors.white,
                      ),
                       SizedBox(
              height: 10,
            ),
                     /*  MaterialButton(
                        color: context.theme.buttonColor,
                       // borderRadius:  BorderRadius.circular(changeButton ? 50 : 8),
                       minWidth: double.maxFinite,
                       height: 50,
                        onPressed: (){
                          Navigator.pushNamed(context,MyRoutes.profileRoute);
                        } ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(width: 10),
                            Text("Back to Profile Page" ,
                            style:TextStyle(color: Colors.white , fontSize: 20)),
                          ],
                        ),
                        textColor: Colors.white,
                      ), */
                    ],
                  ),
                )
              ],
            ),
          ),
        )
       )
        );
  }
}