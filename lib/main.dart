import 'package:flutter/material.dart';
import 'view/home.view.dart';
import 'view/transaction.view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeView(),
        '/transaction': (context) => const TransactionView(),
      },
    );
  }
}
