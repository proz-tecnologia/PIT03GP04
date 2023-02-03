import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:four_finance_app/navigator_key.dart';

class CustomAlertDialog {
  show(
      {required String title,
      required String message,
      String? positiveText,
      String? negativeText,
      VoidCallback? positiveAction,
      VoidCallback? negativeAction}) {
    showDialog(
        context: navigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: SizedBox(
                child: Text(message),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      if (positiveAction != null) positiveAction();
                      //Isso aqui estava fazendo voltar qnd o TOKEN ainda era válido
                      //navigatorKey.currentState!.pop();
                    },
                    child: Text(positiveText ?? "Sim")),
                TextButton(
                    onPressed: () {
                      if (negativeAction != null) negativeAction();
                      navigatorKey.currentState!.pop();
                    },
                    child: Text(negativeText ?? "Não"))
              ],
            ));
  }

  showInfo(
      {required String title,
      required String message,
      String? actionText,
      VoidCallback? action}) {
    showDialog(
        context: navigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: SizedBox(
                child: Text(message),
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                TextButton(
                    onPressed: () {
                      if (action != null) action();
                    },
                    child: Text(actionText ?? "Entendi"))
              ],
            ));
  }
}
