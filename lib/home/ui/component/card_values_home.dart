import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Transaction/controller/transaction.controller.dart';

class CardValuesHome extends StatefulWidget {
  const CardValuesHome({super.key});

  @override
  State<CardValuesHome> createState() => _CardValuesHomeState();
}

class _CardValuesHomeState extends State<CardValuesHome> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionController>(
      builder: (context, transactionController, child) => Column(
        children: [
          Card(
            elevation: 0,
            color: const Color.fromRGBO(217, 217, 217, 100),
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Color.fromRGBO(0, 208, 58, 100),
                width: 3.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: InkWell(
              // ? Debug de teste
              onTap: () {
                Navigator.pushNamed(context, '/contas_receber');
              },
              child: SizedBox(
                width: 400,
                height: 100,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ListTile(
                      minVerticalPadding: 20,
                      title: const Text(
                        "RECEITA",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(0, 208, 58, 100),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        transactionController.getTotalIncoming
                            .toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 32,
                          color: Color.fromRGBO(0, 208, 58, 100),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // ! Espaçamento entre um card e outro
          const SizedBox(
            height: 10,
          ),
          Card(
            elevation: 0,
            color: const Color.fromRGBO(217, 217, 217, 100),
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.red,
                width: 3.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: InkWell(
              // ? Debug de teste
              onTap: () {
                Navigator.pushNamed(context, '/contas_pagar');
              },
              child: SizedBox(
                width: 400,
                height: 100,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ListTile(
                      minVerticalPadding: 20,
                      title: const Text(
                        "DESPESA",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        transactionController.getTotalOutcoming
                            .toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 32,
                          color: Colors.red,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // !Espaçamento entre um card e outro
          const SizedBox(
            height: 10,
          ),
          Card(
            elevation: 0,
            color: const Color.fromRGBO(217, 217, 217, 100),
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Color.fromRGBO(102, 102, 102, 100),
                width: 3.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: InkWell(
              // ? Debug de teste
              onTap: () => (debugPrint('SALDO')),
              child: SizedBox(
                width: 400,
                height: 100,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ListTile(
                      minVerticalPadding: 20,
                      title: const Text(
                        "SALDO",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(102, 102, 102, 100),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        (transactionController.getTotalIncoming -
                                transactionController.getTotalOutcoming)
                            .toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 32,
                          color: Color.fromRGBO(102, 102, 102, 100),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
