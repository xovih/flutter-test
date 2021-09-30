import 'package:flutter/material.dart';
import 'package:kopkar_mart/common/constants.dart';
import 'package:kopkar_mart/common/size_config.dart';
import 'package:kopkar_mart/pages/home_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String routeName = "/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadPage();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(250),
              width: getProportionateScreenWidth(250),
              child: Lottie.asset("assets/lottie/animation_splash.json"),
            ),
            Text(
              "KOPKAR MART",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenHeight(40),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loadPage() async {
    new Future.delayed(const Duration(seconds: 4),
        () => {Navigator.popAndPushNamed(context, HomeScreen.routeName)});
  }
}
