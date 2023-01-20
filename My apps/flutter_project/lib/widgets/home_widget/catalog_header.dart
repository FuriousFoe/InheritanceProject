import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Hostel App".text.xl5.bold.color(context.theme.accentColor).make(),
        "Nearby Hostel's".text.xl2.make(),
      ],
    );
  }
}