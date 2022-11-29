import 'package:uuid/uuid.dart';

class Transaction {
  //Campos da classe q vamos observar com MOBX

  String id = const Uuid().v4();
  TransactionType transactionType;
  DateTime? dateTime;
  String description;
  double valueTransaction;

  //Necessario ter o construtor dos atributos da classe
  Transaction(
    this.transactionType,
    this.dateTime,
    this.description,
    this.valueTransaction,
  );
}

enum TransactionType { INCOME, EXPENSE }
