import 'dart:convert';

import 'package:kopkar_mart/helpers/api_helper.dart';
import 'package:kopkar_mart/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<UserModel> login({
    String? username,
    String? password,
  }) async {
    String urlLogin =
        ApiHelper.URL_API_LOGIN + "&username=$username" + "&password=$password";

    var response = await http.get(Uri.parse(urlLogin));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);

      final SharedPreferences preferences = await _prefs;
      preferences.setBool("isLogin", true);
      preferences.setString("userId", user.id!);

      return user;
    } else {
      throw Exception("Gagal Login !");
    }
  }
}
