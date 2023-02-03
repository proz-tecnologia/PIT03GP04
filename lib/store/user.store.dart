import 'package:four_finance_app/src/models/login_store.dart';

import 'package:mobx/mobx.dart';

part 'user.store.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  @readonly
  LoginStore? _loginStore;

  @action
  loadPerson(LoginStore loginStore) {
    _loginStore = loginStore;
  }
}
