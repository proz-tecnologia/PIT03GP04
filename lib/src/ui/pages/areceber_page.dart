import 'package:flutter/material.dart';
import 'package:four_finance_app/src/models/receber.dart';
import 'package:four_finance_app/widget/lista_receber_item.dart';

class ReceberPage extends StatefulWidget {
  const ReceberPage({super.key});

  @override
  State<ReceberPage> createState() => _ReceberPageState();
}

class _ReceberPageState extends State<ReceberPage> {
  //Responsavel por capturar o que o usuario digita
  final TextEditingController valorEntradaController = TextEditingController();

  List<Receber> entrada = [];
  Receber? receberDeletado;
  int? posicaoReceberDeletado;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 15,
          title: const Text(
            'Lançamento a receber',
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
                    labelText: 'Valor de entrada',
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
                    //Instaciamano a Classe RECEBER
                    Receber newReceber =
                        Receber(value: valor, date: DateTime.now());
                    entrada.add(newReceber);
                  });
                  valorEntradaController.clear();
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
                    for (Receber todo in entrada)
                      ListaEntrada(
                        receber: todo,
                        //passamos a função p o filho lista_receber_item.dart
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

  //criando a função q vai ser passada p o filho lista_receber_item.dart
  void onDelete(Receber todo) {
    //Armazenamos o valor deletado, p desfazer no SNACKBAR
    receberDeletado = todo;
    //Pegamos a posicao do valor deletado p inserir no msm lugar
    posicaoReceberDeletado = entrada.indexOf(todo);

    setState(() {
      entrada.remove(todo);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    //Aviso de remoção do valor
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        //Trabalhar p dps aparecer o dia q foi lançado a entrada
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
              entrada.insert(posicaoReceberDeletado!, receberDeletado!);
            });
          },
        ),
      ),
    );
  }
}
