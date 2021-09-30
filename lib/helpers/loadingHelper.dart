import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading {
  Widget lodingEmptyData(String path, String text, bool isLottie) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isLottie
            ? Lottie.asset(path, width: 80)
            : Image(image: AssetImage(path), width: 70),
        Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ))
      ],
    ));
  }
}
