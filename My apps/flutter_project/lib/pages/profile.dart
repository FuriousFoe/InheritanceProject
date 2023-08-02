import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../utils/routes.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = "";
  String email = "" ;
  String college = "";
  String contact_no =  " " ;
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
    Map<String,dynamic> userData = {"Name" : name , "Email id": email , "Phone no": contact_no , "Colege" : college} ; 
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('UserData') ;
    collectionReference.add(userData) ; 
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
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/images/down.png"),
              ),
               Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  onPressed: (){
             //       Navigator.pushNamed(context,MyRoutes.dummyRoute);
                  },
                style: TextButton.styleFrom(backgroundColor: Colors.purple),
                  child: Icon(
                    Icons.image,
                  ),
              ),
            ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter your name ",
                      labelText: "Name"
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
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter your Email ",
                      labelText: "Email Address"
                      ),
                       validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          email = value;
                          setState(() {});
                        },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter your college name ",
                      labelText: "College"
                      ),
                       validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
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
                      hintText: "Enter your contact no  ",
                      labelText: "Contact No"
                      ),
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
              ElevatedButton( 
                onPressed: setData, 
                child: Text("Update"))
            ],
          ),
        ),
      ),
    );
  }

}
