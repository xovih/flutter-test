import 'package:flutter/material.dart';
import 'package:kopkar_mart/common/constants.dart';

import 'custom_suffix_icon.dart';

class NormalTextForm extends StatelessWidget {
  const NormalTextForm({
    Key? key,
    required this.controller,
    required this.svgAsset,
    required this.labelText,
    required this.labelHint,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String svgAsset;
  final String labelText;
  final String labelHint;
  final FormFieldValidator<String> validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: kPrimaryColor),
        hintText: labelHint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: svgAsset,
        ),
      ),
    );
  }
}
