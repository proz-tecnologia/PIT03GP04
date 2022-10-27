import 'package:flutter/material.dart';
import 'package:four_finance_app/src/models/transaction.dart';
import 'package:four_finance_app/src/ui/pages/new_transaction/new_transaction_item.dart';
// import 'package:four_finance_app/src/ui/pages/new_transaction/new_transaction_item.dart';

class NewTransactionPage extends StatefulWidget {
  const NewTransactionPage({super.key
      // required this.transaction,
      });

  // final Transaction transaction;

  @override
  State<NewTransactionPage> createState() => _NewTransactionPage();
}

class _NewTransactionPage extends State<NewTransactionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
                // Desenvolver aqui Angel
                ),
            Column(
              children: [
                // Row(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // const SizedBox(width: 1),
                    Align(
                      alignment: Alignment.bottomRight,
                      widthFactor: 6.2,
                      heightFactor: 15.0,
                      child: FloatingActionButton(
                        onPressed: () {
                          // print('Clicou');
                          dialogTransaction(context);
                        },
                        child: const Icon(Icons.add),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        )),
      ),
    );
  }

  Future<void> dialogTransaction(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 1, vertical: 20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Lançar Conta',
                    style: TextStyle(
                      color: Colors.amber[700],
                      fontSize: 30.0,
                    ),
                  ),
                ],
              ),
              Column(
                children: const [
                  Divider(
                    height: 25,
                    thickness: 1,
                    indent: 5,
                    endIndent: 0,
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // void cardTransaction(BuildContext context) {
  //   List<String> financialReleasesList = Transaction().financialRelease;
  //   String dropdownValue = financialReleasesList.first;

  //   showDialog(
  //     context: context,
  //     builder: (context) => SingleChildScrollView(
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Container(
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(4),
  //               color: Colors.blue[900],
  //             ),
  //             child: Row(
  //               children: [
  //                 DropdownButton<String>(
  //                   value: dropdownValue,
  //                   icon: const Icon(Icons.arrow_drop_down_circle),
  //                   elevation: 16,
  //                   style: TextStyle(
  //                     color: Colors.amber[800],
  //                   ),
  //                   underline: Container(
  //                     height: 2,
  //                     color: Colors.amber[800],
  //                   ),
  //                   onChanged: (String? value) {
  //                     setState(() {
  //                       dropdownValue = value!;
  //                     });
  //                   },
  //                   items: financialReleasesList
  //                       .map<DropdownMenuItem<String>>((String value) {
  //                     return DropdownMenuItem<String>(
  //                       value: value,
  //                       child: Text(value),
  //                     );
  //                   }).toList(),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
