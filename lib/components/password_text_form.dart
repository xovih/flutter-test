import 'package:flutter/material.dart';
import 'package:kopkar_mart/common/constants.dart';

import 'custom_suffix_icon.dart';

class PasswordTextForm extends StatelessWidget {
  const PasswordTextForm({
    Key? key,
    required this.controller,
    required this.svgAsset,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String svgAsset;
  final validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: true,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(color: kPrimaryColor),
        hintText: "Masukkan Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: svgAsset,
        ),
      ),
    );
  }
}
