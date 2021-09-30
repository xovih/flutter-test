import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kopkar_mart/pages/login/components/body.dart';

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
