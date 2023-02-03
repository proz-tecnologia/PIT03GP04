/*import 'package:mobx/mobx.dart';
import 'package:flutter/foundation.dart';

//part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  //Reaçao da TRIADE do MOBX, podemos usar em outras telas
  _LoginStore() {
    autorun((_) {
      debugPrint(nameUser);
    });
  }

  //Campos da classe que vamos OBSERVAR com MOBX
  @observable
  String nameUser = '';
  String email = '';
  // String password = '';

  LoginStore({this.nameUser = '', this.email = ''});

  LoginStore.fromFirestore(Map<String, dynamic> map) {
    nameUser = map['nameUser'] ?? "";
    email = map['email'] ?? "";
    //password = map['password'] ?? "";
  }

  Map<String, dynamic> toMap() {
    return {'nameUser': nameUser, 'email': email};
  }
}*/

class LoginStore {
  String nameUser = '';
  String email = '';
  // String password = '';

  LoginStore({this.nameUser = '', this.email = ''});

  LoginStore.fromFirestore(Map<String, dynamic> map) {
    nameUser = map['nameUser'] ?? "";
    email = map['email'] ?? "";
    //password = map['password'] ?? "";
  }

  Map<String, dynamic> toMap() {
    return {'nameUser': nameUser, 'email': email};
  }
}
