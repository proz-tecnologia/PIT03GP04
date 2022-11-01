import 'package:flutter/material.dart';
import 'package:four_finance_app/src/models/pagar.dart';
import 'package:four_finance_app/widget/lista_saida_item.dart';

class PagarPage extends StatefulWidget {
  PagarPage({super.key});

  @override
  State<PagarPage> createState() => _PagarPageState();
}

class _PagarPageState extends State<PagarPage> {
  //Responsavel por capturar o que o usuario digita
  final TextEditingController valorEntradaController = TextEditingController();

  List<Pagar> saida = [];
  Pagar? pagarDeletado;
  int? posicaoPagarDeletado;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 15,
          title: const Text(
            'Lançamento a pagar',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                //Aqui pegamos o que foi digitado pelo usuairio
                controller: valorEntradaController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    labelText: 'Valor de saída',
                    prefixText: 'R\$   ',
                    hintText: 'Ex.: 25,00',
                    labelStyle: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    )),
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 20),
                //Sempre q o usuairo digitar vai ser capturado
                //onChanged: onChanged,
                //onSubmitted: onSubmitted,
              ),
              const SizedBox(
                width: 36,
                height: 36,
              ),
              ElevatedButton(
                //Quando o usuario aperta o botao capturamos oq foi digitado
                onPressed: () {
                  String valor = valorEntradaController.text;
                  //Serve p reconstruir a tela
                  setState(() {
                    //Instaciamano a Classe Pagar
                    Pagar newPagar = Pagar(value: valor, date: DateTime.now());
                    saida.add(newPagar);
                  });
                  valorEntradaController.clear();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Lançar'),
                  ],
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              Flexible(
                child: ListView(
                  //Serve p o LISTVIEW se adaptar independente de qnt linhas exista
                  shrinkWrap: true,
                  children: [
                    for (Pagar todo in saida)
                      ListaSaida(
                        pagar: todo,
                        //passamos a função p o filho lista_saida_item.dartpackage:four_finance_app/widget/lista_saida_item.dart
                        onDelete: onDelete,
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //criando a função q vai ser passada p o filho lista_saida_item.dartpackage:four_finance_app/widget/lista_saida_item.dart
  void onDelete(Pagar todo) {
    //Armazenamos o valor deletado, p desfazer no SNACKBAR
    pagarDeletado = todo;
    //Pegamos a posicao do valor deletado p inserir no msm lugar
    posicaoPagarDeletado = saida.indexOf(todo);

    setState(() {
      saida.remove(todo);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    //Aviso de remoção do valor
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        //Trabalhar p dps aparecer o dia q foi lançado a saida
        content: Text(
          'Valor de ${todo.value}, foi removido com sucesso.',
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.red,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          textColor: Colors.black,
          label: 'Voltar',
          onPressed: () {
            setState(() {
              saida.insert(posicaoPagarDeletado!, pagarDeletado!);
            });
          },
        ),
      ),
    );
  }
}
