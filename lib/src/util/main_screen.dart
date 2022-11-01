import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:four_finance_app/src/ui/pages/apagar_page.dart';
import 'package:four_finance_app/src/ui/pages/areceber_page.dart';
import 'package:four_finance_app/src/ui/pages/categoria_page.dart';
import 'package:four_finance_app/src/ui/pages/home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  final screen = [HomePage(), ReceberPage(), PagarPage(), CategoriaPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black26,
        index: selectedIndex,
        items: [
          Icon(Icons.home_outlined, size: 30, color: Colors.blueAccent),
          Icon(Icons.add, size: 30, color: Colors.green),
          Icon(Icons.remove, size: 30, color: Colors.red),
          Icon(Icons.category_outlined, size: 30, color: Colors.brown),
        ],

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        //responsável pela trasição dos botões
        animationCurve: Curves.easeOutBack,
        animationDuration: const Duration(milliseconds: 900),
      ),
      body: screen[selectedIndex],
    );
  }
}
