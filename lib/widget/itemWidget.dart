import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:four_finance_app/extension/extension.double.dart';

//esse widget vai popular a lista da home com tds as transaçoes
class ItemWidget extends StatelessWidget {
  //TransactionStore transactionStore;

  ItemWidget({super.key, required item});

  @override
  Widget build(BuildContext context) {
    //Aqui vai ficar OBSERVANDO os atributos da classe
    return Observer(builder: (_) {
      return ListTile(
          leading: Text(
            'Aqui vai a Data',
          ),
          //'${widget.transactionStore.dateTime?.day}/${widget.transactionStore.dateTime?.month}'),
          isThreeLine: true,
          title: Text('Aqui vai descrição'),
          //Tá no final esse GET
          subtitle: Text('Aqui vai o valor'),
          trailing: FittedBox(
            fit: BoxFit.fill,
            child: Row(
              children: <Widget>[
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                    )),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.remove_circle_outlined))
              ],
            ),
          ));
    });
  }
}
