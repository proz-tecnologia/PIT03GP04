import 'package:flutter/material.dart';
import 'package:four_finance_app/src/controller/transaction_controller.dart';
import 'package:provider/provider.dart';
import 'package:four_finance_app/src/ui/pages/home/home_page.dart';
import 'package:four_finance_app/src/ui/pages/new_transaction/new_transaction_page.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => TransactionController(),
  child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/new-transaction': (context) => const NewTransactionPage(),
      },
    );
  }
}
