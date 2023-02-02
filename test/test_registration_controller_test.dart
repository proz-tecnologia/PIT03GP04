import 'package:flutter_test/flutter_test.dart';
import 'package:four_finance_app/controller/cadLogin.controller.dart';

void main() {
  test('Registration is valid', () {
    final controllerCad = CadLoginController();

    controllerCad.changeEmail('teste@bol.com.br');
    controllerCad.changeName('Ericson');
    controllerCad.changePassword('123456');
    controllerCad.changeRepeatPassword('123456');
  });
}
