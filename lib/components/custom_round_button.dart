import 'package:flutter/material.dart';
import 'package:kopkar_mart/common/constants.dart';
import 'package:kopkar_mart/common/size_config.dart';

class CustomRoundButton extends StatelessWidget {
  const CustomRoundButton(
      {Key? key, required this.onPress, required this.label})
      : super(key: key);
  final onPress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: TextButton(
        onPressed: onPress,
        style: TextButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenHeight(22)),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
