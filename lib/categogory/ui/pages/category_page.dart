import 'package:flutter/material.dart';
import 'package:four_finance_app/categogory/ui/components/category_body.dart';
import 'package:four_finance_app/widget/bottom_navigator.dart';

import '../../../login/ui/component/drawer_page.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Categorias'),
      ),
      drawer: const DrawerView(),
      body: const CategoryBody(),
      bottomNavigationBar: const BottomNavy(),
    );
  }
}
