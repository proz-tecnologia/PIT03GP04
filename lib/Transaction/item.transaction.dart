import 'package:flutter/material.dart';
import 'package:four_finance_app/extension/extension.double.dart';
// import 'package:provider/provider.dart';

import 'models/transaction.model.dart';

//Todo: Esse widget vai popular a lista da home com tds as transaçoes
class ItemTransaction extends StatelessWidget {
  Transaction transaction;

  ItemTransaction(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.all(16),
      elevation: 16,
      shadowColor: Colors.black,
      child: ListTile(
        leading: Text(
          '${transaction.dateTime?.day}/${transaction.dateTime?.month}/${transaction.dateTime?.year}',
          style: TextStyle(color: getColor()),
        ),
        title: Text(
          transaction.description,
          style: TextStyle(color: getColor()),
        ),
        //? Tá no final esse GET
        trailing: Text(getValue(), style: TextStyle(color: getColor())),
      ),
    );
  }

  //Todo: Pegando o valor da transação e o tipo
  String getValue() {
    switch (transaction.transactionType) {
      case TransactionType.INCOME:
        return transaction.valueTransaction.formatBRL;
      case TransactionType.EXPENSE:
        return "(${transaction.valueTransaction.formatBRL})";
    }
  }

  //Todo: Pengando a cor da transação
  Color getColor() {
    switch (transaction.transactionType) {
      case TransactionType.INCOME:
        return Colors.green;
      case TransactionType.EXPENSE:
        return Colors.red;
    }
  }
}
