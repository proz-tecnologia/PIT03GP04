import 'package:flutter/material.dart';
import 'package:four_finance_app/controller/transaction.controller.dart';
import 'package:four_finance_app/src/models/transaction.model.dart';
import 'package:four_finance_app/widget/card.pattern.widget.dart';
import 'package:four_finance_app/login/ui/component/drawer_page.dart';
import 'package:four_finance_app/widget/item.transaction.dart';
import 'package:provider/provider.dart';

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
            child: Card(
              borderOnForeground: true,
              color: Colors.transparent,
              // shape: const RoundedRectangleBorder(
              //   side: BorderSide(
              //     color: Colors.black26,
              //     width: 2.0,
              //   ),
              // ),
              child: InkWell(
                onTap: () => {debugPrint('Teste')},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        border: Border.all(
                          width: 18.0,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                      child: const Text(
                        "Lançamentos",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 3, 158, 3),
                        border: Border.all(
                          width: 18.0,
                          color: const Color.fromARGB(255, 3, 158, 3),
                        ),
                      ),
                      child: const Text(
                        "Entrada",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromRGBO(255, 0, 0, 1),
                        border: Border.all(
                          width: 18.0,
                          color: const Color.fromRGBO(255, 0, 0, 1),
                        ),
                      ),
                      child: const Text(
                        "Saída",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 134, 126, 126),
                        border: Border.all(
                          width: 18.0,
                          color: const Color.fromARGB(255, 134, 126, 126),
                        ),
                      ),
                      child: const Text(
                        "Saldo",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
