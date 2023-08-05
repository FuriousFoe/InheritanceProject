import 'package:flutter/material.dart';
import 'package:flutter_project/models/catalog.dart';
import 'package:flutter_project/pages/homedetailspage.dart';
import 'package:flutter_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../../pages/homedetailspage.dart';
import 'addToCart.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      itemBuilder: (context, index) {
        final catalog = CatalogModel.getByPosition(index);
        return GridTile(
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailPage(catalog: catalog),
              ),
            ),
            child: CatalogItem(catalog: catalog),
          ),
        );
      },
    );
    /*ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.getByPosition(index);
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(catalog: catalog),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      },
    ); */
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Column(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(context.accentColor).bold.make(),
              Row(
                children: [
                  catalog.desc.text.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      //  "\$${catalog.price}".text.bold.xl.make(),
                      //AddToCart()
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.lightBlue),
                            shape: MaterialStateProperty.all(
                              StadiumBorder(),
                            )),
                        child: "+".text.make(),
                      ),
                    ],
                  ).pOnly(right: 8.0)
                ],
              )
            ],
          ))
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();

    // return VxBox(
    //   child: Row(
    //     children: [
    //       Hero(
    //         tag: Key(catalog.id.toString()),
    //         child: CatalogImage(
    //           image: catalog.image,
    //         ),
    //       ),
    //       Expanded(
    //           child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           catalog.name.text.lg.color(context.accentColor).bold.make(),
    //           catalog.desc.text.textStyle(context.captionStyle).make(),
    //           10.heightBox,
    //           ButtonBar(
    //             alignment: MainAxisAlignment.spaceBetween,
    //             buttonPadding: EdgeInsets.zero,
    //            //buttonPadding: Vx.mOnly(right:16),
    //             children: [
    //               "\$${catalog.price}".text.bold.xl.make(),
    //               ElevatedButton(
    //                 onPressed: () {},
    //                 style: ButtonStyle(
    //                     backgroundColor: MaterialStateProperty.all(
    //                         context.theme.buttonColor),
    //                     shape: MaterialStateProperty.all(
    //                       StadiumBorder(),
    //                     )),
    //                 child: "+".text.make(),
    //               )
    //             ],
    //           ).pOnly(right: 8.0)
    //         ],
    //       ))
    //     ],
    //   ),
    // ).color(context.cardColor).rounded.square(150).make().py8();
  }
}
