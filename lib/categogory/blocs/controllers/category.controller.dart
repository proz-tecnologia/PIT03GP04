import 'package:flutter/material.dart';

import '../../data/models/category.dart';

class CategoryController extends ChangeNotifier {
  final List<Category> _categories = [];

  // Todo: Listando todas as categorias cadastradas
  List<Category> get categories => _categories;

  // Todo: adicionando categorias na lista
  void add(Category item) {
    _categories.add(item);
    notifyListeners();
  }
}
