import 'package:flutter/material.dart';
import 'package:four_finance_app/categogory/blocs/controllers/category.controller.dart';
import 'package:four_finance_app/categogory/ui/components/category_card_values.dart';
import 'package:provider/provider.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset('assets/despesas.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Categorias',
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              onPressed: () {
                // debugPrint('Inserindo uma categoria');
                Navigator.pushNamed(context, '/category_create');
              },
              backgroundColor: Colors.blueGrey,
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              height: 40,
              thickness: 2,
              indent: 10,
              endIndent: 10,
              color: Colors.red,
            ),
            SingleChildScrollView(
              child: Consumer<CategoryController>(builder: (_, controller, __) {
                return Column(
                  children: controller.categories
                      .map(
                        (e) => CategoryCardValues(
                          e.category ?? '',
                        ),
                      )
                      .toList(),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
