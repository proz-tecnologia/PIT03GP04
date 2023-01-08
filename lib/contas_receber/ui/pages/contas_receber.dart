import 'package:flutter/material.dart';

import '../../../login/ui/component/drawer_page.dart';

class ContasReceber extends StatelessWidget {
  const ContasReceber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      drawer: const DrawerView(),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
        // Decoration -> BoxDecoration
        // https://api.flutter.dev/flutter/painting/BoxDecoration-class.html
        child: Text("Página de contas a receber"),
      ),
    );
  }
}
