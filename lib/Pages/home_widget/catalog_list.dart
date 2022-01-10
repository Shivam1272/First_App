import 'package:flutter/material.dart';
import 'package:flutter_catalog/Pages/homepage.dart';
import 'package:flutter_catalog/modles/catalog.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Catalog.items.length,
      itemBuilder: (context, index) {
        final catalog = Catalog.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}
