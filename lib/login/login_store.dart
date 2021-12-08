import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:restaurante_escola_app/data/repositories/auth-repository.dart';
import 'package:restaurante_escola_app/home/home_page.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  bool loading = false;

  AuthRepository auth = AuthRepository();

  @action
  Future login(BuildContext context, String email, String password) async {
    loading = true;
    final res = await auth.login(email, password);
    if (res) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      loading = false;
    }
  }
}
