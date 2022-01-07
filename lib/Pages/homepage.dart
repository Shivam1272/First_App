// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
// import 'package:flutter_catalog/Pages/loginpage.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/modles/catalog.dart';
import 'package:flutter_catalog/widgets/itemwidget.dart';

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
    // await Future.delayed(Duration(seconds: 2));
    final catalogjson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedata = jsonDecode(catalogjson);
    var productdata = decodedata["products"];
    // print(productdata);
    Catalog.items = List.from(productdata)
        .map<Item>((items) => Item.fromMap(items))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          // child: (Catalog.items != null && Catalog.items.isNotEmpty)
          child: ListView.builder(
            itemCount: Catalog.items.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemWidget(item: Catalog.items[index]);
            },
          )
          // : Center(
          //     child: CircularProgressIndicator(),
          //   ),
          ),
      drawer: MyDrawer(),
    );
  }
}
