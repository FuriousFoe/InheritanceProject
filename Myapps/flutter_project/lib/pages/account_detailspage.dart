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
  String num = "";
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

  addData() {
    Map<String, dynamic> demoData = {
      "Name": name,
      "Email id": email,
      "Phone no": num,
      "Address": add
    };
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('data');
    collectionReference.add(demoData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        centerTitle: true,
        title: Text(
          "Your Personal Details ",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Implement your back button functionality here
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Implement your search functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              // Implement your cart functionality here
            },
          ),
        ],
      ),
      //  color: context.canvasColor,
      body: Material(
        child: SingleChildScrollView(
          child: Form(
            // ... rest of your form code
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    children: const <Widget>[
                      Text(
                        "Account details :",
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
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
                          labelText: "Full Name ",
                          hintStyle: TextStyle(color: Colors.black45),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 100, 143, 179)),
                            borderRadius: BorderRadius.circular(15),
                          ),
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
                      SizedBox(height: 10),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "abc01@gmail.com",
                          labelText: "Email-id:",
                          hintStyle: TextStyle(color: Colors.black45),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 100, 143, 179)),
                              borderRadius: BorderRadius.circular(15)),
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
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "123456789",
                          labelText: "Phone Number",
                          hintStyle: TextStyle(color: Colors.black45),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 100, 143, 179)),
                            borderRadius: BorderRadius.circular(15),
                          ),
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
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: " 77/55 xyz colony",
                          labelText: "Residential Address",
                          hintStyle: TextStyle(color: Colors.black45),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 100, 143, 179)),
                              borderRadius: BorderRadius.circular(15)),
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
                        color: Colors.blue[200],
                        // borderRadius:  BorderRadius.circular(changeButton ? 50 : 8),
                        minWidth: double.maxFinite,
                        height: 50,
                        onPressed: addData,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(width: 10),
                            Text("Submit",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20)),
                          ],
                        ),
                        textColor: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
