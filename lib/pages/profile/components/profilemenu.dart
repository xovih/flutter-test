import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kopkar_mart/common/constants.dart';
import 'package:kopkar_mart/common/size_config.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.label,
    required this.leftIcon,
    required this.onPress,
  }) : super(key: key);

  final String label;
  final String leftIcon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(20),
      ),
      child: SizedBox(
        height: getProportionateScreenHeight(50),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey.shade300,
            padding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              // side: BorderSide(color: Colors.white),
            ),
          ),
          onPressed: onPress,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(15)),
            child: Row(
              children: [
                SvgPicture.asset(
                  leftIcon,
                  width: getProportionateScreenWidth(20),
                  color: kPrimaryColor,
                ),
                SizedBox(
                  width: getProportionateScreenWidth(20),
                ),
                Expanded(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: kPrimaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
