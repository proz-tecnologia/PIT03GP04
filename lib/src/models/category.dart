// ignore_for_file: constant_identifier_names

import 'package:uuid/uuid.dart';

class Category {
  String id = const Uuid().v4();
  String? name;
  CategoryType? categoryType;

/*
  Category({
    this.name = 'Indefinido',
    this.categoryType = CategoryType.INCOME,
  });*/
}

enum CategoryType { INCOME, EXPENSE }
