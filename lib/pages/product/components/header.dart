import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopkar_mart/common/constants.dart';
import 'package:kopkar_mart/pages/login/login_screen.dart';

class Header extends StatefulWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: GestureDetector(
        onTap: () {
          print("cari");
        },
        child: Container(
          color: Colors.white,
          height: 36,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Platform.isIOS ? CupertinoIcons.search : Icons.search,
                  color: kPrimaryColor,
                ),
                Expanded(
                  child: Text(
                    "Cari Produk",
                    style: kStyleCari,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                  child: Icon(
                    Platform.isIOS
                        ? CupertinoIcons.qrcode_viewfinder
                        : Icons.qr_code_scanner_sharp,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Platform.isIOS ? CupertinoIcons.bell : Icons.notifications,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}
