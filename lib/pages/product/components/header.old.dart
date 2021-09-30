import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kopkar_mart/common/constants.dart';
import 'package:kopkar_mart/common/size_config.dart';

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
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(12),
        vertical: getProportionateScreenWidth(8),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: getProportionateScreenWidth(293),
            height: 44,
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(12),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: kPrimaryColor,
                  ),
                  Text(
                    "Cari Produk",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(50),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset("assets/icons/Bell.svg"),
                ),
                Positioned(
                  right: 0,
                  top: -3,
                  child: Container(
                    height: getProportionateScreenWidth(16),
                    width: getProportionateScreenWidth(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFFF4848),
                      shape: BoxShape.circle,
                      border: Border.all(width: 1.5, color: Colors.white),
                    ),
                    child: Center(
                      child: Text(
                        "3",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(10),
                          height: 1,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
