import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kopkar_mart/pages/home_screen.dart';
import 'package:kopkar_mart/pages/login/components/body.dart';
import 'dart:io' show Platform;

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Platform.isIOS
                  ? Icon(Icons.arrow_back)
                  : Icon(CupertinoIcons.back),
              onPressed: () {
                // Navigator.pop(context);
                print("cook");
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            );
          },
        ),
        centerTitle: true,
        title: Text(
          "Sign In",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.grey.shade100,
      ),
      body: SingleChildScrollView(child: Body()),
    );
  }
}
