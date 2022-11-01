import 'package:flutter/material.dart';
import 'package:four_finance_app/src/ui/pages/apagar_page.dart';
import 'package:four_finance_app/src/ui/pages/areceber_page.dart';
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

      home: SplashPage(),

      //Página que o APP vai Starta
      //initialRoute: '/splash',
      //declaramos todas as rotas (páginas)
      routes: {
        '/splash': (_) => const SplashPage(),
        '/login': (_) => LoginPage(),
        '/mainScreen': (_) => MainScreen(),
        '/home': (_) => HomePage(),
        '/receber': (_) => ReceberPage(),
        '/pagar': (_) => PagarPage(),
        '/categoria': (_) => CategoriaPage(),
      },
    );
  }
}
