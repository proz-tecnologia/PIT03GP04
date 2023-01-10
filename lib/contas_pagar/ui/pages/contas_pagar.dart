import 'package:flutter/material.dart';
import 'package:four_finance_app/home/ui/component/cards_values_releases.dart';
import 'package:four_finance_app/login/ui/component/drawer_page.dart';

class ContasPagar extends StatelessWidget {
  const ContasPagar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Despesas'),
      ),
      drawer: const DrawerView(),
      body: Padding(
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
                "Despesas",
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
                backgroundColor: Colors.red,
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
    );
  }
}
