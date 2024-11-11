import 'package:flutter/material.dart';
import 'package:onof/Models/login_model.dart';
import 'package:onof/Service/login_srevice.dart';

class LoginProvider extends ChangeNotifier {
  LoginModel? loginuser;
  GetData() async {
    List<LoginModel> users = await UserService.getData();
    notifyListeners();
  }

  Future<bool> login({
    required String username,
    required String email,
    required String password,
  }) async {
    bool loginSuccess = await UserService.loginSerivce(
      username: username,
      email: email,
      password: password,
    );
    if (loginSuccess) {
      loginuser = LoginModel(
        username: username,
        email: email,
        password: password,
      );
      notifyListeners();
    }
    return loginSuccess;
  }
}