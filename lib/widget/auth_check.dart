/*import 'package:flutter/material.dart';
import 'package:four_finance_app/services/auth_service.dart';
import 'package:four_finance_app/src/ui/pages/home_page.dart';
import 'package:four_finance_app/src/ui/pages/login_page.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading)
      return loading();
    else if (auth.usuario == null)
      return LoginPage();
    else
      return HomePage();
  }

  loading() {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}*/
