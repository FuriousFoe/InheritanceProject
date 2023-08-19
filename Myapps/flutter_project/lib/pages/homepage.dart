import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_project/models/catalog.dart';
import 'package:flutter_project/utils/routes.dart';
import 'package:flutter_project/widgets/home_widget/catalog_header.dart';
import 'package:flutter_project/widgets/home_widget/catalog_list.dart';
import 'package:flutter_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          title: Text('Hostel App'),
          centerTitle: true,
          actions: [
            Tooltip(
              message: 'Search', // Tooltip message
              child: InkWell(
                onTap: () {
                  // Implement your search functionality here
                },
                splashColor: Colors.blue[100], // Set the splash color here
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),
              ),
            ),
            Tooltip(
              message: 'Cart', // Tooltip message
              child: InkWell(
                onTap: () {
                  // Implement your cart functionality here
                },
                splashColor: Colors.blue[100], // Set the splash color here
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.shopping_cart),
                ),
              ),
            ),
          ],
        ),
        /*AppBar(
          actions: [
            IconButton(
              onPressed: signUserOut , 
            icon: Icon(Icons.logout))
          ],
        ),
        */
        drawer: MyDrawer(),
        backgroundColor: context.canvasColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
