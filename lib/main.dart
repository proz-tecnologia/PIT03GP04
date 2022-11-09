import 'package:flutter/material.dart';
import 'package:four_finance_app/view/sidebar.view.dart';

import 'view/transaction.view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: SideBarView(),
        ),
      ),
    );
  }
}
