import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/models/catalog.dart';
import 'package:flutter_project/utils/routes.dart';
import 'package:flutter_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/routes.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        child : Row(
          children: <Widget>[
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context,MyRoutes.termsRoute);
                  },
                style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
                  child: Icon(
                    Icons.app_registration,
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, MyRoutes.facilityRoute);
                },
                style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
                child:Icon(
                  Icons.assignment_late,
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, MyRoutes.dynamicRoute);
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
                  child:Icon(
                    Icons.home,
                  )
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, MyRoutes.mapRoute);
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
                  child:Icon(
                    Icons.map,
                  )
              ),
            ),
          ],
        ),
       /* color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(context.theme.buttonColor),
                  shape: MaterialStateProperty.all(StadiumBorder())),
              child: "Add to fav".text.make(),
            ).wh(120, 50),
            SquareBox(10),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, MyRoutes.mapRoute),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(context.theme.buttonColor),
                  shape: MaterialStateProperty.all(StadiumBorder())),
              child: "Map".text.make(),
            ).wh(120, 50)
          ],
        ).p32(),  */
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
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
                    catalog.name.text.xl4
                        .color(context.accentColor)
                        .bold
                        .make(),
                    catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                    10.heightBox,
                    "Welcome to the vibrant and spirited haven that is hevan hostel ! Nestled in the heart of a bustling urban landscape, our hostel offers an unmatched fusion of youthful energy and cozy relaxation. Whether you're a solo traveler seeking new connections or a group of friends ready for urban exploration, Lively Haven Hostel is your perfect home away from home."
                        .text
                        .textStyle(context.captionStyle)
                        .make()
                        .p16()
                  ],
                ).py64(),
            )
          )
         ),
        ]
       ),
     )    
    );
  }
}
