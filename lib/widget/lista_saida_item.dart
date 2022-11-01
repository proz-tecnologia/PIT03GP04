import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../src/models/pagar.dart';

class ListaSaida extends StatelessWidget {
  const ListaSaida({super.key, required this.pagar, required this.onDelete});

  //informo que o TITULO, é REQUIRED acima, por tanto qnd chamar esse WIDGET,
  //tem obrigação de me informar o pagar
  final Pagar pagar;
  final Function(Pagar) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color.fromARGB(255, 212, 209, 209),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat('dd/MM/yyyy - HH:mm').format(pagar.date),
                style: TextStyle(fontSize: 16),
              ),
              Text(
                pagar.value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
        actionExtentRatio: 0.25,
        actionPane: SlidableDrawerActionPane(),
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            icon: Icons.cancel_outlined,
            caption: 'Remover',
            onTap: () {
              //O filho recebe do pai areceber_page.dart
              onDelete(pagar);
            },
          )
        ],
      ),
    );
  }
}
