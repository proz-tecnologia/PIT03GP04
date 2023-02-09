import 'package:flutter/material.dart';
import 'package:four_finance_app/categogory/blocs/controllers/category.controller.dart';
// import 'package:four_finance_app/categogory/data/mocks/category_mock.dart';

// import '../../categogory/data/models/category.dart';
import '../models/transaction.model.dart';

class TransactionController extends ChangeNotifier {
  final List<Transaction> _transaction = [];
  final List<CategoryController> _categories = [];

  List<Transaction> get transactions => _transaction;
  List<CategoryController> get categories => _categories;

  TransactionController() {
    // _categories.addAll(CategoryController);
    // notifyListeners();
    debugPrint('Imprimindo as categorias: $_categories.toString()');
    debugPrint('Imprimindo os lançamentos: $_transaction.toString()');
  }

  //Todo: pegando o total de entrada
  double get getTotalIncoming {
    double value = 0;
    var filtered = transactions
        .where((element) => element.transactionType == TransactionType.INCOME);
    for (var transaction in filtered) {
      value += transaction.valueTransaction;
    }
    return value;
  }

  //Todo: pegando o total de saída
  double get getTotalOutcoming {
    double value = 0;
    var filtered = transactions
        .where((element) => element.transactionType == TransactionType.EXPENSE);
    for (var transaction in filtered) {
      value += transaction.valueTransaction;
    }
    return value;
  }

  //Todo: adicionando transação na lista e ordenando por data
  void add(Transaction item) {
    _transaction.add(item);
    _transaction.sort(((a, b) => b.dateTime!.compareTo(a.dateTime!)));
    notifyListeners();
  }

  //Todo: Removendo pelo Id da transação
  void removeById(String id) {
    _transaction.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  //Todo: Removendo pela posição da lista
  void removeByPosition(int index) {
    _transaction.removeAt(index);
    notifyListeners();
  }
}
