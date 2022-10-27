class Transaction {
  String? title;
  DateTime? dateTime;
  double? value;

  List<String> financialRelease = [
    '1 - Contas a pagar',
    '2 - Contas a receber',
  ];

  get getFinancialRelease => financialRelease;
}
