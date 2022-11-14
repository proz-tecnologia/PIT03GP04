import 'package:flutter/material.dart';
import 'package:four_finance_app/strings.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              // ? Aqui estou usando o arquivo Strings e imprimindo o nome do App
              Strings.APP_NAME,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          const ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Contas'),
          ),
          const ListTile(
            leading: Icon(Icons.credit_card_sharp),
            title: Text('Cartões'),
          ),
          ListTile(
            leading: const Icon(Icons.paid),
            title: const Text(
              // ? Aqui estou usando o arquivo Strings e imprimindo o nome da tela (Lançamento)
              Strings.HOME_LABEL_TRANSACTION,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/transaction',
              );
            },
          ),
          const ListTile(
            leading: Icon(Icons.analytics),
            title: Text('Relatórios'),
          ),
          // ? Linha que divide as opções
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
          // ! Dando espaço entre Sonhos e Metas e o Divider com intuito de jogar
          // ! o Logout (Sair) para o rodapé
          const SizedBox(
            height: 360.0,
          ),
          // ? Linha que divide as opções
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
    );
  }
}
