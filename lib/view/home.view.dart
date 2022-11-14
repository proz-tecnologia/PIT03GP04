import 'dart:ui';

import 'package:flutter/Material.dart';
import 'package:four_finance_app/view/widgets/drawer.view.dart';

import '../strings.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.APP_NAME),
        backgroundColor: Colors.red,
      ),
      drawer: const DrawerView(),
      body: const Center(
          child: Text(
        "Home View",
        style: TextStyle(
          fontSize: 50,
          color: Colors.amber,
        ),
      )),
    );
  }
}
