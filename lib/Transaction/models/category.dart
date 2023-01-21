// ignore_for_file: constant_identifier_names

import 'package:uuid/uuid.dart';

class Category {
  String id = const Uuid().v4();
  String? name;
  CategoryType? categoryType;
}

enum CategoryType { INCOME, EXPENSE }
