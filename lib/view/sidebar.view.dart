import 'package:flutter/material.dart';
import 'package:four_finance_app/view/transaction.view.dart';

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
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(
        width: 225,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Column(
              children: const [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  accountName: Text("Ana Clara"),
                  accountEmail: Text("anaclara.dk@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/03/03/08/55/portrait-657116_960_720.jpg'),
                  ),
                ),
              ],
            ),
            const ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('Contas'),
            ),
            const ListTile(
              leading: Icon(Icons.credit_card_sharp),
              title: Text('Cartões'),
            ),
            const ListTile(
              leading: Icon(Icons.paid),
              title: Text('Lançamento'),
            ),
            const ListTile(
              leading: Icon(Icons.analytics),
              title: Text('Relatórios'),
            ),
            // Linha que divide as opções
            const Divider(
              height: 20,
              thickness: 2,
              indent: 10,
              endIndent: 10,
              color: Colors.red,
            ),
            const ListTile(
              leading: Icon(Icons.sell),
              title: Text('Sonhos / Metas'),
            ),
            // Linha que divide as opções
            const SizedBox(
              // width: 50.0,
              height: 165.0,
            ),
            const Divider(
              height: 20,
              thickness: 2,
              indent: 10,
              endIndent: 10,
              color: Colors.red,
            ),
            const ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sair"),
              focusColor: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
