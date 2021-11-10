import 'package:mobx/mobx.dart';
import 'package:restaurante_escola_app/data/repositories/auth-repository.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  bool loading = false;

  AuthRepository auth = AuthRepository();

  @action
  Future login(String email, String password) async {
    loading = true;
    await auth.login(email, password);
    loading = false;
  }
}
