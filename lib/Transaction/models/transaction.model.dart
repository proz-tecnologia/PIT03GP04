// ignore_for_file: constant_identifier_names

import 'package:uuid/uuid.dart';

class Transaction {
  //Campos da classe q vamos observar com MOBX

  String id = const Uuid().v4();
  TransactionType transactionType;
  DateTime? dateTime;
  String description;
  double valueTransaction;

  //Necessario ter o construtor dos atributos da classe
  Transaction({
    this.transactionType = TransactionType.INCOME,
    this.dateTime,
    this.description = '',
    this.valueTransaction = 0,
  });
}

enum TransactionType { INCOME, EXPENSE }
