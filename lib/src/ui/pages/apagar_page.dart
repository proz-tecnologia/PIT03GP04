import 'package:flutter/material.dart';
import 'package:four_finance_app/src/models/pagar.model.dart';
import 'package:four_finance_app/widget/lista_saida_item.dart';

class PagarPage extends StatefulWidget {
  const PagarPage({super.key});

  @override
  State<PagarPage> createState() => _PagarPageState();
}

class _PagarPageState extends State<PagarPage> {
  //Responsavel por capturar o que o usuario digita
  final TextEditingController valorEntradaController = TextEditingController();
  final TextEditingController descricaoEntradaController =
      TextEditingController();

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
                controller: descricaoEntradaController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: 'Descrição da saída',
                    hintText: 'Ex.: Compra do almoço',
                    labelStyle: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    )),
                keyboardType: TextInputType.text,
                style: const TextStyle(fontSize: 20),
                //Sempre q o usuairo digitar vai ser capturado
                //onChanged: onChanged,
                //onSubmitted: onSubmitted,
              ),
              const SizedBox(
                width: 26,
                height: 26,
              ),
              TextField(
                //Aqui pegamos o que foi digitado pelo usuairio
                controller: valorEntradaController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
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
                width: 26,
                height: 26,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
                //Quando o usuario aperta o botao capturamos oq foi digitado
                onPressed: () {
                  double valor = valorEntradaController as double;
                  String descricaoPagar = descricaoEntradaController.text;
                  //Serve p reconstruir a tela
                  setState(() {
                    //Instaciamano a Classe Pagar e adicionamos a listsa
                    Pagar newPagar = Pagar(
                        value: valor,
                        date: DateTime.now(),
                        descricao: descricaoPagar);
                    saida.add(newPagar);
                  });
                  valorEntradaController.clear();
                  descricaoEntradaController.clear();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Lançar'),
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
          style: const TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.red,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 5),
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
