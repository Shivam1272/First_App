// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_catalog/Pages/homepage.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'Pages/loginpage.dart';

void main() {
  runApp(MyApp());
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
      },
    );
  }
}
