import 'package:flutter/material.dart';
import 'package:kopkar_mart/pages/product/components/header.dart';
import 'components/body.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  static String routeName = "/product";
  static String pageLabel = "Beranda";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Header(),
          Body(),
        ],
      ),
    );
  }
}
