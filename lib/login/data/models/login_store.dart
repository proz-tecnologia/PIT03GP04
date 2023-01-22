import 'package:mobx/mobx.dart';
import 'package:flutter/foundation.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  //Todo: Reaçao da TRIADE do MOBX, podemos usar em outras telas
  _LoginStore() {
    autorun((_) {
      debugPrint(nameUser);
    });
  }

  //Todo: Campos da classe que vamos OBSERVAR com MOBX
  @observable
  String nameUser = '';
  String email = '';
  String password = '';

  //Todo: Setando as informações do OBSERVER com MOBX
  @action
  void setNameUser(String value) => nameUser = value;
  void setEmail(String value) => email = value;
  void setPassword(String value) => password = value;
}
