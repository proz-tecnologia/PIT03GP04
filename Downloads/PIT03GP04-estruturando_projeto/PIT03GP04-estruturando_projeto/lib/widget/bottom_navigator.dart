import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavy extends StatelessWidget {
  const BottomNavy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
        child: GNav(
            backgroundColor: Colors.red,
            color: Colors.white,
            activeColor: Colors.red,
            tabBackgroundColor: Colors.white,
            gap: 8,
            padding: EdgeInsets.all(16),
            onTabChange: (index) {
              print(index);
            },
            tabs: [
              GButton(
                // padding: EdgeInsets.all(11),
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                //padding: EdgeInsets.all(10),
                icon: Icons.remove,
                text: "Despesas",
              ),
              GButton(
                icon: Icons.add,
                text: "Receitas",
              ),
              GButton(
                //padding: EdgeInsets.all(10),
                icon: Icons.attach_money,
                text: "Saldo",
              ),
            ]),
      ),
    );
  }
}
