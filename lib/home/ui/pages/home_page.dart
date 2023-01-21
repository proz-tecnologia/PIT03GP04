import 'package:flutter/material.dart';
import 'package:four_finance_app/Transaction/controller/transaction.controller.dart';
import 'package:four_finance_app/widget/card.pattern.widget.dart';
import 'package:four_finance_app/widget/drawer_page.dart';
import 'package:four_finance_app/Transaction/item.transaction.dart';
import 'package:provider/provider.dart';

import '../../../Transaction/models/transaction.model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexGrafico = 0;
  //Instanciamos a HOME CONTROLLER

  Map<String, double> listaValores = {
    'Alimentação': 667.89,
    'Transporte': 550.76,
    'Diversão': 238.99,
    'Educação': 235.99,
    'Saúde': 980.55
  };

  List<Color> listaCores = [
    const Color(0xffD95AF3),
    const Color(0xff3EE094),
    const Color(0xff3398F6),
    const Color(0xffFA4A42),
    const Color(0xffFE9539)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      drawer: const DrawerView(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<TransactionController>(
          builder: (context, transactionController, child) =>
              SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardPattern(const Text('Entrada'), Colors.green,
                        transactionController.getTotalIncoming),
                    //Todo: Card valor entrada - despesas
                    CardPattern(
                        const Text('Resultado'),
                        Colors.white,
                        transactionController.getTotalIncoming -
                            transactionController.getTotalOutcoming),
                    //Todo: Card valor de saída
                    CardPattern(const Text('Saída'), Colors.red,
                        transactionController.getTotalOutcoming),
                  ],
                ),
                ListView.builder(
                    //? Aqui resolveu o erro q n estava aparecendo
                    shrinkWrap: true,
                    itemBuilder: (_, index) => Dismissible(
                          key: ValueKey<Transaction>(
                              transactionController.transactions[index]),
                          direction: DismissDirection.endToStart,
                          resizeDuration: const Duration(seconds: 1),
                          onDismissed: (direction) =>
                              transactionController.removeByPosition(index),
                          child: ItemTransaction(
                            transactionController.transactions[index],
                            key: ValueKey<int>(index),
                          ),
                        ),
                    itemCount: transactionController.transactions.length)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
