// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print, unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/stores.dart';
import 'package:flutter_catalog/modles/cart.dart';
import 'dart:convert';
// import 'package:flutter_catalog/Pages/loginpage.dart';
// import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/modles/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/home_widget/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widget/catalog_list.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';
// import 'package:http/http.dart' as http;
// imnport 'package:flutter_catalog/widgets/itemwidget.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogjson =
        await rootBundle.loadString("assets/files/catalog.json");
    // final response = await http.get(Uri.parse(url));
    // final catalogjson = response.body;
    print(catalogjson);
    final decodedata = jsonDecode(catalogjson);
    var productdata = decodedata["products"];
    Catalog.items = List.from(productdata)
        .map<Item>((items) => Item.fromMap(items))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStores).cart;
    return Scaffold(
        floatingActionButton: VxBuilder(
            mutations: const {AddMutation, RemoveMutation},
            builder: (context, _) => FloatingActionButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, MyRoutes.cartpage),
                  backgroundColor: const Color(0xff403b58),
                  child: Icon(CupertinoIcons.cart),
                ).badge(
                  color: Vx.red500,
                  size: 22,
                  count: _cart.items.length,
                  textStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (Catalog.items != null && Catalog.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().py16().expand()
              ],
            ),
          ),
        ));
  }
}
