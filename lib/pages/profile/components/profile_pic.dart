import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kopkar_mart/common/size_config.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
    required this.imgUrl,
    required this.onPress,
  }) : super(key: key);

  final String imgUrl;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(120),
      width: getProportionateScreenWidth(120),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imgUrl),
          ),
          Positioned(
            right: -12,
            bottom: 0,
            child: SizedBox(
              height: getProportionateScreenWidth(42),
              width: getProportionateScreenWidth(42),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                ),
                onPressed: onPress,
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
