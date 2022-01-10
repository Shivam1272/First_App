// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
// import 'package:flutter_catalog/Pages/loginpage.dart';
// import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/modles/catalog.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

import 'home_widget/catalog_header.dart';
import 'home_widget/catalog_image.dart';
import 'home_widget/catalog_list.dart';
// imnport 'package:flutter_catalog/widgets/itemwidget.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogjson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedata = jsonDecode(catalogjson);
    var productdata = decodedata["products"];
    Catalog.items = List.from(productdata)
        .map<Item>((items) => Item.fromMap(items))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: Vx.m32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHeader(),
            if (Catalog.items != null && Catalog.items.isNotEmpty)
              CatalogList().expand()
            else
              CircularProgressIndicator().centered().py16().expand()
          ],
        ),
      ),
    ));
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
        child: Row(
      children: [
        CatalogImage(image: catalog.image),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(Color(0xff403b58)).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.xl.bold.make(),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff403b58)),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.make())
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).white.rounded.square(150).make().py16();
  }
}
