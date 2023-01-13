import 'package:flutter/material.dart';
import 'package:four_finance_app/controller/transaction.controller.dart';
import 'package:four_finance_app/src/models/login_store.dart';
import 'package:four_finance_app/src/ui/pages/cadLogin_page.dart';
import 'package:four_finance_app/widget/drawer_page.dart';
import 'package:four_finance_app/src/ui/pages/transaction_page.dart';
import 'package:four_finance_app/src/ui/pages/login_page.dart';
import 'package:four_finance_app/src/ui/pages/splash_page.dart';
import 'package:provider/provider.dart';
import 'src/ui/pages/home_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<TransactionController>(create: (_) => TransactionController()),
      Provider<LoginStore>(create: (_) => LoginStore()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Msm com MOBX precisamos do provider p trafegar dados entre telas
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //Página que o APP vai Starta
      initialRoute: '/splash',
      //declaramos todas as rotas (páginas)
      routes: {
        '/splash': (_) => const SplashPage(),
        '/login': (_) => const LoginPage(),
        '/cadUsuario': (_) => const CadUsuarioPage(),
        '/drawer': (_) => const DrawerView(),
        '/home': (_) => const HomePage(),
        '/transaction': (_) => const TransactionPage(),
      },
    );
  }
}
