import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../utils/routes.dart';
import '../widgets/add_profile/textfield_widget.dart';
import 'package:flutter_project/pages/globals.dart'as globals ;

class vacantPG extends StatefulWidget {
  @override
  State<vacantPG> createState() => _vacantPGState();
}

class _vacantPGState extends State<vacantPG> {
  
  String rent = " " ;
  String room_no = " " ;
  String size = "";
  String vacancy = " " ;
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
   
  // setData (){
  //   Map<String,dynamic> vacantData = {"Rent" : rent , "Room No ": room_no , "Vacancy": vacancy , "Size" : size } ; 
  //   CollectionReference collectionReference = FirebaseFirestore.instance.collection('PGData') ;
  //   collectionReference.add(vacantData) ; 
  // }

  setData() async {
  Map<String, dynamic> vacantData = { "Rent": rent, "Room No": room_no, "Vacancy": vacancy,"Size": size, };

  // Reference to the main collection
  CollectionReference mainCollection = FirebaseFirestore.instance.collection('PGData');

  // Document ID of the target document
  String documentId = globals.globalDocumentId ;

  // Reference to the specific document in the main collection
  DocumentReference documentReference = mainCollection.doc(documentId);

  // Subcollection name
  String subcollectionName = 'Vacant'; // Replace with your desired subcollection name

  // Add the data to the subcollection
  CollectionReference subCollectionReference = documentReference.collection(subcollectionName);
  subCollectionReference.add(vacantData);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title : const Text("Vacant Rooms") ,
        ),
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
              //              rent = value;
              //              setState(() {});
              //            },
              // ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter Rent",
                      labelText: "Minimum Rent"
                      ),
                       validator: (value) {
                          if (value!.isEmpty) {
                            return "rent cannot be empty";
                          }

                          return null;
                        },
                        onChanged: (value) {
                          rent = value;
                          setState(() {});
                        },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter room_no ",
                      labelText: "room_no "
                      ),
                       validator: (value) {
                          if (value!.isEmpty) {
                            return "room_no cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          room_no = value;
                          setState(() {});
                        },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "size",
                      labelText: "Size of Room"
                      ),
                       validator: (value) {
                          if (value!.isEmpty) {
                            return "cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          size = value;
                          setState(() {});
                        },
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: " Vacancy ",
                      labelText: "Vacancy "
                      ),
                       validator: (value) {
                          if (value!.isEmpty) {
                            return "cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          vacancy = value;
                          setState(() {});
                        },
                ),
              ),
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
