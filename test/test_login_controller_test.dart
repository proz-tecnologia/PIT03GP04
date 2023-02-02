import 'package:flutter_test/flutter_test.dart';
import 'package:four_finance_app/controller/login.controller.dart';

void main() {
  test('Login valid', () {});
  final controllerLogin = LoginController();

  controllerLogin.changeNameUser('values');
  controllerLogin.changeEmail('teste@bol.com.br');
  controllerLogin.changePassword('123456');

  //controllerLogin.doLogin();
}
