import 'package:flutter/material.dart';
import 'package:four_finance_app/view/widgets/drawer.view.dart';
import 'package:four_finance_app/view/widgets/pieChart.view.dart';

import '../strings.dart';

class TransactionView extends StatefulWidget {
  const TransactionView({super.key});

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.HOME_LABEL_TRANSACTION),
        backgroundColor: Colors.red,
      ),
      drawer: const DrawerView(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      debugPrint('A receber');
                    },
                    label: const Text(
                      "A receber",
                      style: TextStyle(color: Colors.green),
                    ),
                    icon: const Icon(
                      Icons.add_circle,
                      size: 20.0,
                      color: Colors.green,
                    ),
                  ),
                  // ? Para dar espaço entre
                  const SizedBox(
                    width: 70.0,
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      debugPrint('A pagar');
                    },
                    label: const Text(
                      "A pagar",
                      style: TextStyle(color: Colors.red),
                    ),
                    icon: const Icon(
                      Icons.remove_circle,
                      size: 20.0,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // ? Inserindo o gráfico na página
              const PieChartSample2()
            ],
          ),
        ),
      ),
    );
  }
}
