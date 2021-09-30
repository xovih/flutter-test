import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kopkar_mart/common/size_config.dart';
import 'package:kopkar_mart/components/platform_widget.dart';
import 'package:kopkar_mart/pages/cart/cart_screen.dart';
import 'package:kopkar_mart/pages/product/product_screen.dart';
import 'package:kopkar_mart/pages/profile/profile_screen.dart';
import 'package:kopkar_mart/pages/wishlist/wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomNavIndex = 0;

  List<Widget> _listPages = [
    ProductScreen(),
    WishlistScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.home : Icons.cottage_outlined),
      label: ProductScreen.pageLabel,
    ),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.heart : Icons.favorite_border),
      label: WishlistScreen.pageLabel,
    ),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS
          ? CupertinoIcons.shopping_cart
          : Icons.shopping_bag_outlined),
      label: CartScreen.pageLabel,
    ),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.person : Icons.person_outline),
      label: ProfileScreen.pageLabel,
    ),
  ];

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _listPages[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3,
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: (selected) {
          setState(() {
            _bottomNavIndex = selected;
          });
        },
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _bottomNavBarItems,
      ),
      tabBuilder: (context, index) {
        return _listPages[index];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.deepOrange));
    SizeConfig().init(context);
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
