import 'package:flutter/material.dart';
import 'package:kopkar_mart/common/size_config.dart';
import 'package:kopkar_mart/models/user_model.dart';
import 'package:kopkar_mart/pages/profile/components/profile_pic.dart';
import 'package:kopkar_mart/pages/profile/components/profilemenu.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.userModel}) : super(key: key);

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(15),
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            "Profile",
            style: TextStyle(fontSize: getProportionateScreenWidth(18)),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        ProfilePic(
          imgUrl: userModel.photoUrl!,
          onPress: () {},
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        ProfileMenu(
          leftIcon: "assets/icons/User Icon.svg",
          label: "Akun Saya",
          onPress: () {},
        ),
        ProfileMenu(
          leftIcon: "assets/icons/Settings.svg",
          label: "Alamat",
          onPress: () {},
        ),
        ProfileMenu(
          leftIcon: "assets/icons/Bell.svg",
          label: "Transaksi",
          onPress: () {},
        ),
        ProfileMenu(
          leftIcon: "assets/icons/Lock.svg",
          label: "Ganti Password",
          onPress: () {},
        ),
        ProfileMenu(
          leftIcon: "assets/icons/Log out.svg",
          label: "Log Out",
          onPress: () {},
        ),
      ],
    );
  }
}
