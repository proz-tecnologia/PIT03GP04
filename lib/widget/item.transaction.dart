import 'package:flutter/material.dart';
import 'package:four_finance_app/controller/transaction.controller.dart';
import 'package:four_finance_app/extension/extension.double.dart';
import 'package:four_finance_app/src/models/transaction.model.dart';
import 'package:provider/provider.dart';

//esse widget vai popular a lista da home com tds as transaçoes
class ItemTransaction extends StatelessWidget {
  Transaction transaction;

  ItemTransaction(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      margin: const EdgeInsets.all(16),
      elevation: 16,
      shadowColor: Colors.black,
      child: ListTile(
          leading: Text(
            '${transaction.dateTime?.day}/${transaction.dateTime?.month}/${transaction.dateTime?.year}',
          ),
          //'${widget.transactionStore.dateTime?.day}/${widget.transactionStore.dateTime?.month}'),
          isThreeLine: true,
          title: Text(transaction.description),
          //Tá no final esse GET
          subtitle: Text(getValue()),
          trailing: FittedBox(
              fit: BoxFit.fill,
              child: Consumer<TransactionController>(
                builder: (context, transactinController, child) =>
                    SingleChildScrollView(
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.amber,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.remove_circle_outlined,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
              ))),
    );
  }

  //Pegando o valor da transação e o tipo
  String getValue() {
    switch (transaction.transactionType) {
      case TransactionType.INCOME:
        return transaction.valueTransaction.formatBRL;
      case TransactionType.EXPENSE:
        return "(${transaction.valueTransaction.formatBRL})";
    }
  }
}
