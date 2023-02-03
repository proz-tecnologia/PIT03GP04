import 'package:flutter_test/flutter_test.dart';
import 'package:four_finance_app/controller/transaction.controller.dart';
import 'package:four_finance_app/src/models/transaction.model.dart';

void main() {
  test('Executed transactions', () {
    final controllerTransaction = TransactionController();

    controllerTransaction.getTotalIncoming;
    controllerTransaction.getTotalIncoming;
    controllerTransaction.add(Transaction());
    controllerTransaction.removeById('1');
    //controllerTransaction.removeByPosition(2);
  });
}
