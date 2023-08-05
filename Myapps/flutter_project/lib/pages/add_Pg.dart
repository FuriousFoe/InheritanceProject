import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../utils/routes.dart';

class addYourPG extends StatefulWidget {
  @override
  State<addYourPG> createState() => _addYourPGState();
}

class _addYourPGState extends State<addYourPG> {
  String pgname = " ";
  String location = " ";
  String college = "";
  String contact_no = " ";
  String owenrs_name = " ";
  String Vacancy = " ";
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

  setData() {
    Map<String, dynamic> userData = {
      "Name": pgname,
      "location id": location,
      "Phone no": contact_no,
      "College": college,
      "Owner Name": owenrs_name
    };
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('PGData');
    collectionReference.add(userData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap: () {}, child: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(16.0)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter Pg name ", labelText: "Name"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "name cannot be empty";
                    }

                    return null;
                  },
                  onChanged: (value) {
                    pgname = value;
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter location ",
                      labelText: "location Address"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "location cannot be empty";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    location = value;
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter nearest college name ",
                      labelText: "College"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "cannot be empty";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    college = value;
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter owner's name  ", labelText: "Name "),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "name cannot be empty";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    owenrs_name = value;
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter owner's contact no  ",
                      labelText: "Contact No"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username cannot be empty";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    contact_no = value;
                    setState(() {});
                  },
                ),
              ),
              ElevatedButton(onPressed: setData, child: Text("Update"))
            ],
          ),
        ),
      ),
    );
  }
}
