// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:flutter_catalog/Pages/loginpage.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/modles/catalog.dart';
import 'package:flutter_catalog/widgets/itemwidget.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummylist = List.generate(25, (index) => Catalog.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: ListView.builder(
        itemCount: dummylist.length,
        itemBuilder: (context, index) {
          return ItemWidget(item: dummylist[index]);
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
