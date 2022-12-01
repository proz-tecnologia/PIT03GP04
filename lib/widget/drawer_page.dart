import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:four_finance_app/src/models/login_store.dart';
import 'package:four_finance_app/src/util/string.dart';
import 'package:provider/provider.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  //Chamando a CLASSE LOGIN q contém o MOBX, foi removido (= LoginStore();), por conta do PROVIDER
  late LoginStore loginStore;

  //usado p transitar dados com MOBX o PROVIDER é necessário
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loginStore = Provider.of<LoginStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        // width: 225,
        child: Center(
          child: Column(
            children: [
              Container(
                  color: Colors.white,
                  height: 200,
                  //Td esse WIDGET esta sendo observad com MOBX
                  child: Observer(builder: (_) {
                    return UserAccountsDrawerHeader(
                      decoration: const BoxDecoration(
                        color: Colors.red,
                      ),
                      accountName: Text(
                        'Seja bem-vindo(a), ${loginStore.nameUser}',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      accountEmail: const Text(
                        'loginStore.email',
                        //Caso decidam exibir o email do usuario

                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      currentAccountPicture: const CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/03/03/08/55/portrait-657116_960_720.jpg',
                        ),
                      ),
                    );
                  })),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.home),
                        title: const Text(
                          // ? Aqui estou usando o arquivo Strings e imprimindo o nome do App
                          Strings.APP_NAME,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/home');
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
                          Navigator.pushNamed(context, '/transaction');
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
                      Column(
                        children: [
                          // ? Linha que divide as opções
                          const Divider(
                            height: 20,
                            thickness: 2,
                            indent: 10,
                            endIndent: 10,
                            color: Colors.red,
                          ),

                          ListTile(
                            leading: const Icon(Icons.logout),
                            title: const Text("Sair"),
                            focusColor: Colors.red,
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/login');
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
