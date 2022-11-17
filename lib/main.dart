import 'package:flutter/material.dart';
import 'package:four_finance_app/src/ui/pages/apagar_page.dart';
import 'package:four_finance_app/src/ui/pages/areceber_page.dart';
import 'package:four_finance_app/src/ui/pages/cadUsuario_page.dart';
import 'package:four_finance_app/src/ui/pages/categoria_page.dart';
import 'package:four_finance_app/src/util/main_screen.dart';
import 'package:four_finance_app/src/ui/pages/login_page.dart';
import 'package:four_finance_app/src/ui/pages/splash_page.dart';
import 'src/ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //home: LoginPage(),

      //Página que o APP vai Starta
      initialRoute: '/login',
      //declaramos todas as rotas (páginas)
      routes: {
        '/splash': (_) => const SplashPage(),
        '/login': (_) => const LoginPage(),
        '/cadusuario': (_) => const CadUsuarioPage(),
        '/mainScreen': (_) => const MainScreen(),
        '/home': (_) => const HomePage(),
        '/receber': (_) => const ReceberPage(),
        '/pagar': (_) => const PagarPage(),
        '/categoria': (_) => const CategoriaPage(),
      },
    );
  }
}
