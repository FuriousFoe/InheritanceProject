
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/utils/routes.dart';

class Frame extends StatefulWidget {
  const Frame({Key? key}) : super(key: key);

  @override
  State<Frame> createState() => _FrameState();
}

class _FrameState extends State<Frame> {
  bool newDeals = false;
  bool newsLetter = false;
  bool specialOffers = false;
  String name = "";
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Settings",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () { 
                 Navigator.pushNamed(context, MyRoutes.accountRoute);
               },
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                          child: ListTile(
                        leading: Icon(Icons.person, color: Colors.blueAccent),
                        title: Text(
                          'Account',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('Personal Information'),
                        trailing: Icon(Icons.edit),
                        
                      )
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        child: ListTile(
                          leading:
                              Icon(Icons.location_on, color: Colors.blueAccent),
                          title: Text(
                            'Address',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text('Residential address'),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(5.0),
                    //   child: Card(
                    //       child: ListTile(
                    //     leading: Icon(Icons.add_card, color: Colors.blueAccent),
                    //     title: Text(
                    //       'Payment Method',
                    //       style: TextStyle(fontWeight: FontWeight.bold),
                    //     ),
                    //     subtitle: Text(
                    //       'Connected credit cards',
                    //     ),
                    //   )),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(5.0),
                    //   child: Card(
                    //     child: ListTile(
                    //       leading: Icon(Icons.security, color: Colors.blueAccent),
                    //       title: Text(
                    //         'Security',
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //       subtitle: Text('Password'),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
             
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Card(
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "Personal Information",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 350,
                      height: 28,
                      child: Row(
                        children: [
                          Text(
                            "First Name:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textWidthBasis: TextWidthBasis.longestLine,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Rohit",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textWidthBasis: TextWidthBasis.longestLine,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 350,
                      height: 28,
                      child: Row(
                        children: [
                          Text(
                            "Last Name:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textWidthBasis: TextWidthBasis.longestLine,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Parkhe",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textWidthBasis: TextWidthBasis.longestLine,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 350,
                      height: 28,
                      child: Row(
                        children: [
                          Text(
                            "Email ID:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textWidthBasis: TextWidthBasis.longestLine,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "rnparkhe_b21@it.vjti.ac.in",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textWidthBasis: TextWidthBasis.longestLine,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 350,
                      height: 28,
                      child: Row(
                        children: [
                          Text(
                            "Phone Number:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textWidthBasis: TextWidthBasis.longestLine,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "9876543210",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textWidthBasis: TextWidthBasis.longestLine,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Help & Support',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(5),
                child: Card(
                    child: Column(
                  children: [
                    CheckboxListTile(
                        value: newDeals,
                        onChanged: (val) {
                          setState(() {
                            newDeals = val!;
                          });
                        },
                        activeColor: Colors.blue,
                        title: Text("Feedback")),
                    CheckboxListTile(
                        value: newsLetter,
                        onChanged: (val) {
                          setState(() {
                            newsLetter = val!;
                          });
                        },
                        activeColor: Colors.blue,
                        title: Text("About Us")),
                    CheckboxListTile(
                        value: specialOffers,
                        onChanged: (val) {
                          setState(() {
                            specialOffers = val!;
                          });
                        },
                        activeColor: Colors.blue,
                        title: Text("Special Offers"))
                  ],
                ))),
            SizedBox(
              height: 20,
            ),
            // Center(
            //   child: Row(
            //     children: [
            //       Container(
            //           alignment: Alignment.center,
            //           width: 180,
            //           height: 40,
            //           child: Text(
            //             "Discard changes",
            //             style: TextStyle(fontSize: 15),
            //           )),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Container(
            //           alignment: Alignment.center,
            //           width: 150,
            //           height: 40,
            //           color: Colors.blue,
            //           child: Text(
            //             "Save changes",
            //             style: TextStyle(fontSize: 15, color: Colors.white),
            //           ))
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                width: 300,
                height: 58,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.red)),
                child: Text(
                  "Log out",
                  style: TextStyle(fontSize: 17, color: Colors.red),
                )),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
     // drawer: Drawer(),
    );
  }
}
