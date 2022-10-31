import 'package:four_finance_app/src/mocks/category_mock.dart';
import 'package:four_finance_app/src/models/category.dart';
import 'package:four_finance_app/src/models/transaction.dart';
import 'package:flutter/material.dart';

import '../mocks/transaction_mock.dart';

class TransactionController extends ChangeNotifier {
  final List<Category> _categories = [];
  final List<Transaction> _transactions = [];

  TransactionController() {
    _categories.addAll(CategoryMock.getCategories());
    _transactions.addAll(TransactionMock.generateTransactions(25, _categories));
    _transactions.sort(((a, b) => b.dateTime!.compareTo(a.dateTime!)));
  }

  List<Category> get categories => _categories;
  List<Transaction> get transactions => _transactions;

  double get getTotalIncoming {
    double value = 0;
    var filtered = _transactions
        .where((element) => element.transactionType == TransactionType.INCOME);
    for (var transaction in filtered) {
      value += transaction.value;
    }
    return value;
  }

  double get getTotalOutcoming {
    double value = 0;
    var filtered = _transactions
        .where((element) => element.transactionType == TransactionType.EXPENSE);
    for (var transaction in filtered) {
      value += transaction.value;
    }
    return value;
  }

  void add(Transaction item) {
    _transactions.add(item);
    _transactions.sort(((a, b) => b.dateTime!.compareTo(a.dateTime!)));
    notifyListeners();
  }

  void removeByID(String id) {
    _transactions.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  void removeByPosition(int index) {
    _transactions.removeAt(index);
    notifyListeners();
  }
}
