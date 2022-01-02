// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Image.asset(
                "assets/Images/login.png",
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter UserName", labelText: "UserName :"),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password :"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text("Login"))
                  ],
                ),
              )
            ]));
  }
}
