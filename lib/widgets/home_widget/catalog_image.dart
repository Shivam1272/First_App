// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image})
      : assert(image != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(const Color(0xfff5f5f5))
        .make()
        .p16()
        .w40(context);
  }
}
