//to do
import 'package:four_finance_app/src/models/category.dart';

abstract class CategoryMock {
  static List<Category> getCategories() {
    return {"Alimentação", "Jogos", "Educação", "Saúde", "Transporte"}
        .map((e) => Category(name: e))
        .toList();
  }
}
