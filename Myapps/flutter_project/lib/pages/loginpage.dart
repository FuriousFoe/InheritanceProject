import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/utils/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  String password = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  getData() {
    Map<String, dynamic> loginData = {"Name": name, "Password": password};
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('login');
    collectionReference.add(loginData);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white12,
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      height: 200,
                      width: 200,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                        child: Image.asset(
                          "assets/images/LoginIcon.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                          color: Colors.black, fontSize: 28, fontFamily: "Edu"),
                    ),
                    const Text(
                      "Where Every Stay Feels Like Home ",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Mukta",
                        fontSize: 18,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 32.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: const InputDecoration(
                                      hintText: "Enter username",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      hintStyle:
                                          TextStyle(color: Colors.black38),
                                      labelText: "Username",
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 1.5))),
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
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    hintText: "Enter password",
                                    hintStyle: TextStyle(color: Colors.black38),
                                    labelText: "Password",
                                    labelStyle: TextStyle(color: Colors.black),
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
                                    password = value;
                                    setState(() {});
                                  },
                                ),
                                const SizedBox(
                                  height: 40.0,
                                ),
                                Material(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(
                                      changeButton ? 50 : 8),
                                  child: InkWell(
                                    //  onTap: () => moveToHome(context),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, MyRoutes.homeRoute);
                                      getData();
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 1),
                                      width: changeButton ? 50 : 150,
                                      height: 50,
                                      alignment: Alignment.center,
                                      child: changeButton
                                          ? const Icon(
                                              Icons.done,
                                              color: Colors.white,
                                            )
                                          : const Text(
                                              "Login",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Divider(
                            indent: 20,
                            endIndent: 10,
                            color: Colors.black,
                            thickness: 1,
                          ),
                        ),
                        Text(
                          "OR",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Divider(
                            indent: 20,
                            endIndent: 10,
                            color: Colors.black,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        print("singIn");
                        // For Navigator of Sign in page
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black,
                        ),
                        height: 50,
                        width: 140,
                        child: const Center(
                            child: Text(
                          "Sign-In",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
