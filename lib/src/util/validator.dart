import 'package:flutter/material.dart';

class Validators {
  //Construtor privado
  Validators._();

  static FormFieldValidator compare(
      TextEditingController? senhaEditingController, String message) {
    return (confirSenhaController) {
      final valueCompare = senhaEditingController?.text ?? '';
      if (confirSenhaController == null ||
          (confirSenhaController != null &&
              confirSenhaController != valueCompare)) {
        return message;
      }
      return null;
    };
  }
}
