import 'package:flutter/foundation.dart';
import 'package:kopkar_mart/models/user_model.dart';
import 'package:kopkar_mart/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> login({
    String? username,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        username: username,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
