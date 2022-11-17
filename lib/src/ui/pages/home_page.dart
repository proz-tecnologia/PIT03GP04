import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

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
    return SafeArea(
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
    );
  }
}
