// ignore_for_file: constant_identifier_names

import 'package:uuid/uuid.dart';

import '../../categogory/data/models/category.dart';

class Transaction {
  //Todo: Campos da classe q vamos observar com MOBX

  String id = const Uuid().v4();
  TransactionType transactionType;
  DateTime? dateTime;
  Category? category;
  String description;
  double valueTransaction;

  //Todo: Necessario ter o construtor dos atributos da classe
  Transaction({
    this.transactionType = TransactionType.INCOME,
    this.dateTime,
    this.category,
    this.description = '',
    this.valueTransaction = 0.0,
  });
}

enum TransactionType { INCOME, EXPENSE }
