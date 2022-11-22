import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  //Reaçao da TRIADE do MOBX, podemos usar em outras telas
  _LoginStore() {
    autorun((_) {
      print(nameUser);
      print(email);
      print(password);
    });
  }

  //Campos da classe que vamos OBSERVAR com MOBX
  @observable
  String nameUser = '';
  String email = '';
  String password = '';

  //setando as informações do OBSERVER com MOBX
  @action
  void setNameUser(String value) => nameUser = value;
  void setEmail(String value) => email = value;
  void setPassword(String value) => password = value;
}
