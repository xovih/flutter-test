import 'package:flutter/widgets.dart';
import 'package:kopkar_mart/pages/cart/cart_screen.dart';
import 'package:kopkar_mart/pages/home_screen.dart';
import 'package:kopkar_mart/pages/login/login_screen.dart';
import 'package:kopkar_mart/pages/product/product_screen.dart';
import 'package:kopkar_mart/pages/profile/profile_screen.dart';
import 'package:kopkar_mart/pages/splash/splash_screen.dart';
import 'package:kopkar_mart/pages/wishlist/wishlist_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProductScreen.routeName: (context) => ProductScreen(),
  WishlistScreen.routeName: (context) => WishlistScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
};
