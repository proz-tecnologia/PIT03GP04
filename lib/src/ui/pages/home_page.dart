import 'package:flutter/material.dart';
import 'package:four_finance_app/controller/transaction.controller.dart';
import 'package:four_finance_app/src/models/transaction.model.dart';
import 'package:four_finance_app/src/util/string.dart';
import 'package:four_finance_app/widget/card.pattern.widget.dart';
import 'package:four_finance_app/widget/card_result.dart';
import 'package:four_finance_app/widget/drawer_page.dart';
import 'package:four_finance_app/widget/item.transaction.dart';
import 'package:pie_chart/pie_chart.dart';
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
          title: Text('Home Page'),
          centerTitle: true,
        ),
        drawer: const DrawerView(),
        body: Consumer<TransactionController>(
            builder: (context, transactionController, child) =>
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CardResult(
                            incomingValue:
                                transactionController.getTotalIncoming,
                            outcomingValue:
                                transactionController.getTotalOutcoming,
                          ),
                        ],
                      ),
                      ListView.builder(
                        //aqui resolveu o erro q n estava aparecendo
                        shrinkWrap: true,
                        itemBuilder: (_, index) => Dismissible(
                          key: ValueKey<Transaction>(
                              transactionController.transactions[index]),
                          direction: DismissDirection.endToStart,
                          resizeDuration: Duration(seconds: 1),
                          onDismissed: (direction) =>
                              transactionController.removeByPosition(index),
                          child: ItemTransaction(
                            transactionController.transactions[index],
                            key: ValueKey<int>(index),
                          ),
                        ),
                        itemCount: transactionController.transactions.length,
                      )
                    ],
                  ),

                  /*ListView.builder(
    itemCount: 6,
    itemBuilder: (_, index) {
      //Retornamos o ITEMWIDGET q tem o OBERSERVEBLE
      return ItemWidget(item: null);
    },
      ),*/ /*Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          alignment: Alignment.topCenter,
          child: Card(
            margin: const EdgeInsets.all(32),
            elevation: 25,
            surfaceTintColor: Colors.amber,
            shadowColor: Colors.black,
            child: SizedBox(
              width: 450,
              height: 300,
              child: PieChart(
                dataMap: listaValores,
                colorList: listaCores,
                //Definindo o tamanho da pizza
                chartRadius: MediaQuery.of(context).size.width / 3,
                //centerText: 'Pd escrever algo no meio',
                chartType: ChartType.ring,
                ringStrokeWidth: 24,
                animationDuration: const Duration(seconds: 3),
                chartValuesOptions: const ChartValuesOptions(
                    //mostrar valores
                    showChartValues: true,
                    //mostrar valores fora do grafico
                    showChartValuesOutside: true,
                    //mostrar valores em porcentagem
                    showChartValuesInPercentage: false,
                    //mostrar o fundo dos valores
                    showChartValueBackground: false),
                legendOptions: const LegendOptions(
                    showLegends: true,
                    legendShape: BoxShape.circle,
                    legendTextStyle: TextStyle(fontSize: 16)),
              ),
              //child: Center(),
            ),
          ),
        ),
      ),
      SizedBox(height: 24),
      ListView.builder(
        itemCount: 6,
        itemBuilder: (_, index) {
          return ItemWidget();
        },
      ),
    ],
      ),*/
                )));
  }
}
