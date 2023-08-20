import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/pages/button_page.dart';
import 'package:flutter_project/pages/vacant.dart';
import '../utils/routes.dart';
import '../widgets/add_profile/textfield_widget.dart';
import 'package:flutter_project/pages/globals.dart'as globals ;

class addYourPG extends StatefulWidget {
  @override
  State<addYourPG> createState() => _addYourPGState();
}

class _addYourPGState extends State<addYourPG> {
  String pgname = " " ;
  String location = " " ;
  String college = "";
  String contact_no = " " ;
  String owenrs_name = " " ;
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
   
  setData (){
    Map<String,dynamic> pgData = {"Name" : pgname , "location id": location , "Phone no": contact_no , "College" : college , "Owner Name" : owenrs_name } ; 
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('PGData') ;
    collectionReference.add(pgData).then((DocumentReference doc) {
      print("My Document id is ${doc.id}") ;
      globals.globalDocumentId = doc.id;
    }  ) ; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0)) ,

              //  TextFieldWidget(
              //   label: 'PG Name',
              //   text: "Enter pg Name" ,
              //   onChanged:  (value) {
              //              pgname = value;
              //              setState(() {});
              //            },
              // ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter Pg name ",
                      labelText: "Pg Name"
                      ),
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
                      labelText: "location Address"
                      ),
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
                      labelText: "Nearest College"
                      ),
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
                      hintText: "Enter owner's name ",
                      labelText: "Owner's Name "
                      ),
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
                      hintText: "Enter owner's contact no ",
                      labelText: "Owner's Contact No"
                      ),
                       validator: (value) {
                          if (value!.isEmpty) {
                            return "Contact cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          contact_no = value;
                          setState(() {});
                        },
                ),
              ),
              ElevatedButton( 
                onPressed: (){
                  Navigator.pushNamed(context, MyRoutes.vacantRoute) ;
                }, 
                child: Text("Add Data about Vacant rooms")),
              ElevatedButton( 
                onPressed: (){
                  Navigator.pushNamed(context, MyRoutes.upcomingRoute) ;
                }, 
                child: Text("Rooms having an upcoming vacancy")),
              ElevatedButton( 
                onPressed: (){
                  Navigator.pushNamed(context, MyRoutes.occupiedRoute) ;
                }, 
                child: Text("Add Data about Occupied rooms")),
              ElevatedButton( 
                onPressed: setData, 
                child: Text("Upload"))
            ],
          ),
        ),
      ),
    );
  }
}