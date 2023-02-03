import 'package:flutter/material.dart';
import 'package:four_finance_app/src/ui/pages/home_page.dart';
import 'package:four_finance_app/src/ui/pages/login_page.dart';

class CheckAuth extends StatelessWidget {
  final bool userIsAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    return userIsAuthenticated ? HomePage() : LoginPage();
  }
}
