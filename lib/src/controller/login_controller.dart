import 'package:flutter/material.dart';

class LoginController {
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);
  String? _login;
  String? _senha;

  setLogin(String value) => _login = value;
  setSenha(String value) => _senha = value;

  Future<bool> auth() async {
    inLoader.value = true;

    await Future.delayed(const Duration(seconds: 2));
    inLoader.value = false;

    return _login == 'ericson' && _senha == '12345';
  }
}
