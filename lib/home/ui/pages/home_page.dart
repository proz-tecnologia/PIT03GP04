import 'package:flutter/material.dart';
import 'package:four_finance_app/home/ui/component/card_values_home.dart';
import 'package:four_finance_app/login/ui/component/drawer_page.dart';
import 'package:provider/provider.dart';

import '../../../Transaction/controller/transaction.controller.dart';
import '../component/cards_values_releases.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
        child: Consumer<TransactionController>(
          builder: (context, transactionController, child) =>
              SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CardValuesHome(),
                // ! Espaço entre os cards e a linha abaixo
                SizedBox(
                  height: 30,
                ),
                // ! Linha que dividi as informações da Home.
                Divider(
                  height: 40,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                  color: Colors.red,
                ),
                // ! Espaço entre a linha abaixo e os lançamentos
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 9.0),
                  child: Text(
                    "Últimos Lançamentos",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // ! Espaço entre a linha abaixo e os lançamentos
                SizedBox(
                  height: 20,
                ),
                // ? Chamando a tela de cards com lançamento
                CardValuesReleases(),
                SizedBox(
                  height: 10,
                ),
                CardValuesReleases(),
                SizedBox(
                  height: 10,
                ),
                CardValuesReleases(),
                SizedBox(
                  height: 10,
                ),
                CardValuesReleases(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
