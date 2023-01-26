import 'package:flutter/material.dart';
import 'package:four_finance_app/categogory/blocs/controllers/category.controller.dart';
import 'package:four_finance_app/categogory/data/models/category.dart';
import 'package:provider/provider.dart';

import '../../../login/ui/component/drawer_page.dart';
import '../../../widget/bottom_navigator.dart';

class FormularioCreateCategory extends StatefulWidget {
  const FormularioCreateCategory({super.key});

  @override
  State<FormularioCreateCategory> createState() =>
      _FormularioCreateCategoryState();
}

class _FormularioCreateCategoryState extends State<FormularioCreateCategory> {
  final _formKey = GlobalKey<FormState>();

  final _userInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Categorias'),
      ),
      drawer: const DrawerView(),
      body: Padding(
        padding: const EdgeInsets.only(top: 128.0),
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Card(
                elevation: 20,
                margin: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Categorias',
                      style: TextStyle(fontSize: 24),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _userInput,
                                  decoration: const InputDecoration(
                                    labelText: 'Categoria',
                                  ),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  maxLength: 30,
                                  validator: (value) {
                                    if (value!.length < 3 ||
                                        value.length > 30) {
                                      return "Nome da categoria deve ter entre 4 a 30 caractéres.";
                                    }
                                    return null;
                                  },
                                  onSaved: (newValue) {
                                    _userInput.text = newValue!.toString();
                                    debugPrint(newValue);
                                  },
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    OutlinedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/category_list');
                                      },
                                      child: const Text(
                                        'Cancelar',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 115,
                                    ),
                                    Consumer<CategoryController>(
                                        builder: (_, controller, ___) {
                                      return OutlinedButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _formKey.currentState!.save();
                                            final category = Category(
                                              category: _userInput.text,
                                            );

                                            controller.add(category);

                                            debugPrint(controller
                                                .categories.length
                                                .toString());

                                            Navigator.pushNamed(
                                                context, '/category_list');
                                          }
                                        },
                                        child: const Text(
                                          'Salvar',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.blueGrey,
                                          ),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavy(),
    );
  }
}
