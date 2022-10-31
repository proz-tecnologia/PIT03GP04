import 'package:flutter/material.dart';
import 'package:four_finance_app/src/ui/pages/home/widgets/grafico_pizza.dart';
import 'package:four_finance_app/src/strings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
          title: const Text(Strings.APP_NAME),
          titleTextStyle: const TextStyle(color: Colors.yellow),
          actions: [
            PopupMenuButton<MenuActionType>(
              onSelected: _handleMenuClick,
              itemBuilder: (context) => [
                const PopupMenuItem<MenuActionType>(
                    value: MenuActionType.NEW_TRANSACTION,
                    child: Text("New Transaction"))
              ],
            ),
          ]),
      //drawer: DrawerMenu(_drawerMenuItemActive, onChangeContent),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          GraficoPizza(),
        ],
      ),
    );
  }

  void _handleMenuClick(MenuActionType menuActionType) {
    switch (menuActionType) {
      case MenuActionType.NEW_TRANSACTION:
        Navigator.of(context).pushNamed("/new-transaction");
        break;
    }
  }
}

enum MenuActionType { NEW_TRANSACTION }
