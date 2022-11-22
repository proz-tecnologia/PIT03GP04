import 'package:flutter/material.dart';
import 'package:four_finance_app/src/models/category.dart';
import 'package:four_finance_app/src/models/transaction.dart';
import 'package:four_finance_app/src/ui/pages/drawer_page.dart';
import 'package:four_finance_app/src/util/string.dart';

class TransactionView extends StatefulWidget {
  const TransactionView({super.key});

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

//Código Deivyd, classe no final. Titulos usados na ROW
class _TransactionViewState extends State<TransactionView> {
  final _transactionTypes = [
    TransactionTypeOption('Entrada', TransactionType.INCOME, Colors.green),
    TransactionTypeOption('Saída', TransactionType.INCOME, Colors.red)
  ];

  var _transactionType = TransactionType.INCOME;
  var _value = 0.0;
  var _description = '';
  Category? _category;
  var _dateTime = DateTime.now();

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
              //Aqui determinamos qual o tipo de transação 'e'
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _transactionTypes
                    .map((e) => ChoiceChip(
                        selectedColor: e.color,
                        labelStyle: const TextStyle(color: Colors.white),
                        label: Text(e.label),
                        selected: e.type == _transactionType,
                        onSelected: (value) => setState(() {
                              _transactionType = e.type;
                            })))
                    .toList(),
              ),

              //Pegar o FORM código professor

              //const SizedBox(height: 30),
              // ? Inserindo o gráfico na página
              //const PieChartSample2()
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionTypeOption {
  String label;
  TransactionType type;
  Color color;

  TransactionTypeOption(
    this.label,
    this.type,
    this.color,
  );
}
