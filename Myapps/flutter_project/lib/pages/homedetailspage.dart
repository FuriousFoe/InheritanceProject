import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/models/catalog.dart';
import 'package:flutter_project/pages/button_page.dart';
import 'package:flutter_project/pages/facilities_page.dart';
import 'package:flutter_project/pages/maps/google_map_api.dart';
import 'package:flutter_project/pages/terms_page.dart';
import 'package:flutter_project/utils/routes.dart';
import 'package:flutter_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/routes.dart';

class HomeDetailPage extends StatefulWidget {
  final Item catalog;

  HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  int _currentIndex = 0;
  BBnavigate(int index) {
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Terms()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Facilities()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GoogleMapAPI()));
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          centerTitle: true,
          title: const Text(
            "Hostel",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // Implement your cart functionality here
              },
              splashColor: Colors.blue[200], // Set the splash color here
            ),
          ],
        ),
        // backgroundColor: context.canvasColor,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              print(_currentIndex);
              // BBnavigate();
            });
            BBnavigate(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.app_registration, color: Colors.black26),
              label: 'Terms',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_late, color: Colors.black26),
              label: 'Facility',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black26),
              label: 'Dynamic',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map, color: Colors.black26),
              label: 'Map',
            ),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white,
        ),
        body: SafeArea(
            bottom: false,
            child: Container(
              color: Colors
                  .lightBlue[100], // Set your desired background color here
              padding: EdgeInsets.only(top: 16), // Add some space from the top
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          12), // Set the border radius for rounded corners
                      child: Hero(
                        tag: Key(widget.catalog.id.toString()),
                        child: Image.network(widget.catalog.image),
                      ),
                    ),
                  ),
                  Expanded(
                    child: VxArc(
                      height: 30.0,
                      arcType: VxArcType.CONVEY,
                      edge: VxEdge.TOP,
                      child: Container(
                        color: context.cardColor,
                        width: context.screenWidth,
                        child: Column(
                          children: [
                            widget.catalog.name.text.xl4
                                .color(context.accentColor)
                                .bold
                                .make(),
                            widget.catalog.desc.text
                                .textStyle(context.captionStyle)
                                .xl
                                .make(),
                            10.heightBox,
                            "Dolor sea takim eirmod dolor labore dolores magna. Amet vero vero vero kasd, dolore sea sed sit invidunt nonumy est sit clita. Diam aliquyam amet tempor diam no aliquyam invidunt. Elitr lorem eirmod dolore clita. Rebum."
                                .text
                                .textStyle(context.captionStyle?.copyWith(
                                  fontSize: 16, // Set the font size
                                  color: Colors.black, // Set the text color
                                ))
                                .make()
                                .p16(),
                          ],
                        ).py64(),
                      ),
                    ),
                  ),
                ],
              ),
            )

            /*
          Column(children: [
            Hero(
              tag: Key(widget.catalog.id.toString()),
              child: Image.network(widget.catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
                    height: 30.0,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      color: context.cardColor,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          widget.catalog.name.text.xl4
                              .color(context.accentColor)
                              .bold
                              .make(),
                          widget.catalog.desc.text
                              .textStyle(context.captionStyle)
                              .xl
                              .make(),
                          10.heightBox,
                          "Dolor sea takim eirmod dolor labore dolores magna. Amet vero vero vero kasd, dolore sea sed sit invidunt nonumy est sit clita. Diam aliquyam amet tempor diam no aliquyam invidunt. Elitr lorem eirmod dolore clita. Rebum."
                              .text
                              .textStyle(context.captionStyle)
                              .make()
                              .p16()
                        ],
                      ).py64(),
                    ))),
          ]),*/
            ));
  }
}
