// ignore_for_file: constant_identifier_names

import 'package:four_finance_app/src/models/category.dart';
import 'package:uuid/uuid.dart';

class Transaction {
  String id = const Uuid().v4();
  TransactionType transactionType;
  DateTime? dateTime;
  Category? category;
  String description;
  double value;

  Transaction(
      {this.transactionType = TransactionType.INCOME,
        this.dateTime,
        this.category,
        this.description = "",
        this.value = 0.0});
}

enum TransactionType { INCOME, EXPENSE }


//era o que tinha
// class Transaction {
//   String? title;
//   DateTime? dateTime;
//   double? value;
//
//   List<String> financialRelease = [
//     '1 - Contas a pagar',
//     '2 - Contas a receber',
//   ];
//
//   get getFinancialRelease => financialRelease;
// }
