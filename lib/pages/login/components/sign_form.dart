import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kopkar_mart/common/constants.dart';
import 'package:kopkar_mart/common/size_config.dart';
import 'package:kopkar_mart/components/custom_round_button.dart';
import 'package:kopkar_mart/components/custom_suffix_icon.dart';
import 'package:kopkar_mart/components/round_loading_button.dart';
import 'package:kopkar_mart/pages/home_screen.dart';
import 'package:kopkar_mart/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  bool isLoading = false;

  late String username;
  late String password;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async {
      setState(() {
        isLoading = true;
      });
      if (await authProvider.login(
        username: username,
        password: password,
      )) {
        Navigator.pop(context);
        Navigator.popAndPushNamed(context, HomeScreen.routeName);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.pinkAccent,
            content: Text(
              "Gagal Login, Check username atau password !",
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
      setState(() {
        isLoading = false;
      });
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildUsernameField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildPasswordField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          // FormError(erot: errors),
          Container(
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(getProportionateScreenHeight(15)),
                ),
              ),
              child: Text(
                "Lupa Password ?",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          isLoading
              ? RoundLoadingButton()
              : CustomRoundButton(
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      handleSignIn();
                    }
                  },
                  label: "Continue",
                ),
        ],
      ),
    );
  }

  TextFormField buildUsernameField() {
    return TextFormField(
      onSaved: (newValue) => username = newValue!,
      onChanged: (value) {
        if ((value.isNotEmpty) && errors.contains(kNoUsername)) {
          setState(() {
            errors.remove(kNoUsername);
          });
        }
        return null;
      },
      validator: (value) {
        if ((value == null || value.isEmpty) && !errors.contains(kNoUsername)) {
          setState(() {
            errors.add(kNoUsername);
          });
        }
        return null;
      },
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        labelText: "Username",
        labelStyle: TextStyle(color: kPrimaryColor),
        hintText: "Masukkan NPP atau Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/user.svg",
        ),
      ),
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if ((value.isNotEmpty) && errors.contains(kNoPassword)) {
          setState(() {
            errors.remove(kNoPassword);
          });
        }
        return null;
      },
      validator: (value) {
        if ((value == null || value.isEmpty) && !errors.contains(kNoPassword)) {
          setState(() {
            errors.add(kNoPassword);
          });
        }
        return null;
      },
      obscureText: true,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(color: kPrimaryColor),
        hintText: "Massword Anda",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }
}

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.erot,
  }) : super(key: key);

  final List<String> erot;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        erot.length,
        (index) => formErrorText(erot[index]),
      ),
    );
  }

  Row formErrorText(String error) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: getProportionateScreenWidth(14),
          width: getProportionateScreenWidth(14),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(error),
      ],
    );
  }
}
