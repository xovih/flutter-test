import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static String routeName = "/profile";
  static String pageLabel = "Profil";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String username = "";
  // String? password;

  handlePref() async {
    final SharedPreferences preferences = await _prefs;
    setState(() {
      username = preferences.getString('id')!;
    });
  }

  @override
  void initState() {
    super.initState();
    handlePref();
  }

  @override
  Widget build(BuildContext context) {
    // handlePref();
    return Container(
      child: Center(
        child: Text(
          username,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
