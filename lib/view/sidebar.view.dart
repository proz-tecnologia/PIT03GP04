import 'package:flutter/material.dart';

class SideBarView extends StatefulWidget {
  const SideBarView({super.key});

  @override
  State<SideBarView> createState() => _SideBarViewState();
}

class _SideBarViewState extends State<SideBarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas finanças'),
        backgroundColor: Colors.indigo.shade400,
      ),
      drawer: Drawer(
        width: 225,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              // Para ajustar o texto no box
              // padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              // margin: EdgeInsets.only(bottom: 1),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 92, 107, 192),
              ),
              child: Text(
                'Minhas Finanças',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('Contas'),
            ),
            ListTile(
              leading: Icon(Icons.credit_card_sharp),
              title: Text('Cartões'),
            ),
            ListTile(
              leading: Icon(Icons.paid),
              title: Text('Lançamento'),
            ),
            ListTile(
              leading: Icon(Icons.analytics),
              title: Text('Relatórios'),
            ),
            Divider(
              height: 20,
              thickness: 2,
              indent: 10,
              endIndent: 10,
              color: Color.fromARGB(255, 92, 107, 192),
            ),
            ListTile(
              leading: Icon(Icons.sell),
              title: Text('Sonhos / Metas'),
            ),
          ],
        ),
      ),
    );
  }
}
