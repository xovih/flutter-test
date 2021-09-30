import 'package:flutter/material.dart';
import 'package:kopkar_mart/common/constants.dart';
import 'package:kopkar_mart/common/size_config.dart';
import 'package:kopkar_mart/pages/login/components/sign_form.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight! * 0.04,
              ),
              Text(
                "Welcome Back",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Silahkan Sign In terlebih dahulu untuk kemudahan belanja di Kopkar Mart",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.12,
              ),
              SignForm(),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tidak punya akun ? ",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
