import 'package:flutter/material.dart';
import 'package:four_finance_app/contas_receber/ui/pages/contas_receber.dart';
import 'package:four_finance_app/controller/transaction.controller.dart';
import 'package:four_finance_app/login/ui/component/drawer_page.dart';
import 'package:four_finance_app/src/ui/pages/transaction_page.dart';
import 'package:four_finance_app/login/ui/component/splash_page.dart';
import 'package:provider/provider.dart';

import 'contas_pagar/ui/pages/contas_pagar.dart';
import 'home/ui/pages/home_page.dart';
import 'login/data/models/login_store.dart';
import 'login/ui/pages/cadLogin_page.dart';
import 'login/ui/pages/login_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TransactionController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Msm com MOBX precisamos do provider p trafegar dados entre telas
    return MultiProvider(
      providers: [
        Provider<LoginStore>(create: (_) => LoginStore()),
      ],
      child: MaterialApp(
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
          '/contas_receber': (_) => const ContasReceber(),
          '/contas_pagar': (_) => const ContasPagar(),
        },
      ),
    );
  }
}
