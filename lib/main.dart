// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/Pages/homepage.dart';
import 'package:flutter_catalog/utils/routes.dart';

import 'Pages/cart_page.dart';
import 'Pages/loginpage.dart';
import 'core/stores.dart';

void main() {
  runApp(VxState(store: MyStores(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeroutes,
      routes: {
        "/": (context) => Homepage(),
        MyRoutes.homeroutes: (context) => Homepage(),
        MyRoutes.loginroutes: (context) => LoginPage(),
        MyRoutes.cartpage: (context) => CartPage(),
      },
    );
  }
}
