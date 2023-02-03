import 'package:flutter/material.dart';
import 'package:four_finance_app/navigator_key.dart';

class ProgressDialog {
  bool _isShowing = false;

  show(String message) {
    if (_isShowing) return;
    _isShowing = true;
    showDialog(
        context: navigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
              backgroundColor: Colors.blue,
              content: SizedBox(
                height: 140,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      message,
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ));
  }

  hide() {
    if (!_isShowing) return;
    _isShowing = false;
    navigatorKey.currentState!.pop();
  }
}
