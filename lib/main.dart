import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:four_finance_app/controller/transaction.controller.dart';
import 'package:four_finance_app/src/models/login_store.dart';
import 'package:four_finance_app/src/ui/pages/cadLogin_page.dart';
import 'package:four_finance_app/store/user.store.dart';
import 'package:four_finance_app/widget/drawer_page.dart';
import 'package:four_finance_app/src/ui/pages/transaction_page.dart';
import 'package:four_finance_app/src/ui/pages/login_page.dart';
import 'package:four_finance_app/src/ui/pages/splash_page.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'src/ui/pages/home_page.dart';

void main() {
  GetIt.instance.registerSingleton(UserStore());

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
          initialRoute: '/cadUsuario',
          //declaramos todas as rotas (páginas)
          routes: {
            '/splash': (_) => const SplashPage(),
            '/login': (_) => const LoginPage(),
            '/cadUsuario': (_) => CadUsuarioPage(),
            '/drawer': (_) => const DrawerView(),
            '/home': (_) => const HomePage(),
            '/transaction': (_) => const TransactionPage(),
          },
        ));
  }
}
