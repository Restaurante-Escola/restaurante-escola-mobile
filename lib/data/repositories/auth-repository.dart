import 'dart:convert';

import 'package:restaurante_escola_app/data/models/login/login-result-model.dart';
import 'package:restaurante_escola_app/shared/secure-store-mixin.dart';

import 'api.dart';

class AuthRepository with SecureStoreMixin {
  Future login(String email, String password) async {
    try {
      var res = await ApiClient.api().post(
        "auth",
        data: {
          "email": email,
          "senha": password,
        },
      );
      print("$res");
      var user = LoginResultModel.fromJson(res.data);


      await setAuthToken(user.token);
      return true;
    } catch (e) {
      print('Error send watched post: $e');
    }
  }
}
