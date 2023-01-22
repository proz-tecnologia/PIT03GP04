import 'package:flutter/material.dart';
import 'package:four_finance_app/home/ui/component/cards_values_releases.dart';
import 'package:four_finance_app/login/ui/component/drawer_page.dart';

import '../../../widget/bottom_navigator.dart';

class ContasReceber extends StatelessWidget {
  const ContasReceber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Receitas'),
      ),
      drawer: const DrawerView(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset('assets/receitas.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Receitas",
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
                  debugPrint('Teste');
                },
                backgroundColor: Colors.green,
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
                child: Column(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    CardValuesReleases(),
                    SizedBox(
                      height: 10,
                    ),
                    CardValuesReleases(),
                    SizedBox(
                      height: 10,
                    ),
                    CardValuesReleases(),
                    SizedBox(
                      height: 10,
                    ),
                    CardValuesReleases(),
                    SizedBox(
                      height: 10,
                    ),
                    CardValuesReleases(),
                    SizedBox(
                      height: 10,
                    ),
                    CardValuesReleases(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavy(),
    );
  }
}
