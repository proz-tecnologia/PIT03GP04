import 'package:flutter/material.dart';

//import 'package:four_finance_app/src/ui/pages/home/widgets/grafico_pizza.dart';
import 'package:four_finance_app/src/strings.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _width = 0;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

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
                    child: Text("Nova Transação"))
              ],
            ),
          ]),
      drawer: const Drawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: Colors.white30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularPercentIndicator(
                  radius: 96.0,
                  lineWidth: 13.0,
                  animation: true,
                  percent: 0.3,
                  center: const Text(
                    "30.0%",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.red),
                  ),
                  footer: const Text(
                    "Saldo Restante",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        color: Colors.red),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.red,
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            ListTile(
              leading:
                  CircleAvatar(radius: 8, backgroundColor: Colors.blue[800]),
              title: const Text("Saldo Financeiro: R\$ 161,00"),
            ),
            ListTile(
              leading:
                  CircleAvatar(radius: 8, backgroundColor: Colors.blue[600]),
              title: const Text("Total de Despesas: R\$ 69,00"),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text("Metas",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0)),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                LinearPercentIndicator(
                  width: _width / 2 - 32,
                  lineHeight: 21.0,
                  percent: 0.6,
                  progressColor: Colors.blue[800],
                  barRadius: const Radius.circular(25),
                ),
                const Text("Meta 1 - 60% alcançada")
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                LinearPercentIndicator(
                  width: _width / 2 - 32,
                  lineHeight: 21.0,
                  percent: 0.37,
                  progressColor: Colors.blue[600],
                  barRadius: const Radius.circular(25),
                ),
                const Text("Meta 2 - 37% alcançada")
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                LinearPercentIndicator(
                  width: _width / 2 - 32,
                  lineHeight: 21.0,
                  percent: 0.28,
                  progressColor: Colors.blue[400],
                  barRadius: const Radius.circular(25),
                ),
                const Text("Meta 3 - 28% alcançada")
              ],
            )
          ],
        ),
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
