//to do
import 'dart:math';

import 'package:four_finance_app/src/models/transaction.dart';

import '../models/category.dart';
import '../util/random_util.dart';

abstract class TransactionMock {
  static List<Transaction> generateTransactions(
      int size, List<Category> categories) {
    return List<Transaction>.generate(size, (index) {
      categories.shuffle();
      return Transaction(
          transactionType: TransactionType.values[Random().nextInt(2)],
          dateTime: RandomUtil.generateRandomDate(
              DateTime.now().subtract(const Duration(days: 30)), 30),
          category: categories.first,
          description:
          "Transacion #${Random().nextInt(100).toString().padLeft(3, '0')}",
          value: Random().nextDouble() * 1000);
    });
  }
}
