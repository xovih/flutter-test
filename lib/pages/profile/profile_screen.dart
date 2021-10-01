import 'package:flutter/material.dart';
import 'package:kopkar_mart/pages/login/login_screen.dart';
import 'package:kopkar_mart/pages/profile/components/body.dart';
import 'package:kopkar_mart/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";
  static String pageLabel = "Profil";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLogged = false;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  isLoggedIn() async {
    final SharedPreferences preferences = await _prefs;

    if (preferences.containsKey("isLogin")) {
      this.setState(() {
        isLogged = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    if (!isLogged) {
      Navigator.pushNamed(context, LoginScreen.routeName);
      return Container();
    } else {
      AuthProvider userProv = Provider.of<AuthProvider>(context, listen: false);
      return SafeArea(
        child: SingleChildScrollView(
          child: Body(
            userModel: userProv.user,
          ),
        ),
      );
    }
  }
}
