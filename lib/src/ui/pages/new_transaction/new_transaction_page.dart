import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:four_finance_app/src/controller/transaction_controller.dart';
import 'package:four_finance_app/src/models/category.dart';
import 'package:four_finance_app/src/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewTransactionPage extends StatefulWidget {
  const NewTransactionPage({super.key});

  @override
  State<NewTransactionPage> createState() => _NewTransactionPageState();
}

class _NewTransactionPageState extends State<NewTransactionPage> {
  final _transactionTypes = [
    TransactionTypeOption("Receita", TransactionType.INCOME, Colors.green),
    TransactionTypeOption("Despesa", TransactionType.EXPENSE, Colors.red)
  ];

  final _formKey = GlobalKey<FormState>();

  var _transactionType = TransactionType.INCOME;
  var _value = 0.0;
  var _description = "";
  Category? _category;
  var _dateTime = DateTime.now();

  final _txtDateTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("Nova Transação"),
        titleTextStyle: const TextStyle(color: Colors.yellow),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            )),
        actions: [
          IconButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final transaction = Transaction(
                      transactionType: _transactionType,
                      dateTime: _dateTime,
                      description: _description,
                      value: _value);

                  Provider.of<TransactionController>(context, listen: false)
                      .add(transaction);
                  Navigator.pop(context);
                }
              },
              icon: const Icon(
                Icons.save,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _transactionTypes
                    .map((e) => ChoiceChip(
                    selectedColor: e.color,
                    labelStyle: const TextStyle(color: Colors.white),
                    label: Text(e.label),
                    selected: e.type == _transactionType,
                    onSelected: (value) => setState(() {
                      _transactionType = e.type;
                    })))
                    .toList(),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text("Categoria"),
              Consumer<TransactionController>(
                  builder: (context, transactionController, child) {
                    return DropdownButtonFormField<Category>(
                      items: transactionController.categories
                          .map((e) => DropdownMenuItem<Category>(
                          value: e, child: Text(e.name)))
                          .toList(),
                      value: _category,
                      onChanged: (newValue) => _category = newValue,
                      hint: const Text("Selecione"),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null) {
                          return "Selecione uma categoria.";
                        }
                        return null;
                      },
                      onSaved: (newValue) => _category = newValue,
                    );
                  }),
              const SizedBox(
                height: 4,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  CurrencyTextInputFormatter(
                      locale: "pt_BR", decimalDigits: 2, symbol: '')
                ],
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                    labelText: "Valor",
                    hintText: "0,00",
                    prefix: Text("R\$ "),
                    helperText: "No máximo 999.999,99."),
                maxLength: 10,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe um valor.";
                  }
                  final valueDouble = double.parse(
                      value.replaceAll('.', '').replaceAll(',', '.'));
                  if (valueDouble == 0) {
                    return "Informe um valor diferente de 0";
                  }
                  return null;
                },
                onSaved: (newValue) => _value = double.parse(
                    newValue!.replaceAll('.', '').replaceAll(',', '.')),
              ),
              const SizedBox(
                height: 4,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Descrição"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLength: 30,
                validator: (value) {
                  if (value!.length < 3 || value.length > 30) {
                    return "Campo deve ter ao menos 3 e no máximo 30 caractéres.";
                  }
                  return null;
                },
                onSaved: ((newValue) => _description = newValue!),
              ),
              const SizedBox(
                height: 4,
              ),
              TextFormField(
                controller: _txtDateTimeController,
                keyboardType: TextInputType.datetime,
                decoration:
                const InputDecoration(labelText: "Data da Operação"),
                maxLength: 10,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe uma data.";
                  }
                  return null;
                },
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  DateTime? date = await showDatePicker(
                      context: context,
                      firstDate:
                      DateTime.now().subtract(const Duration(days: 360)),
                      lastDate: DateTime.now(),
                      initialDate: _dateTime);
                  _dateTime = date ?? _dateTime;
                  _txtDateTimeController.text =
                  "${_dateTime.day}/${_dateTime.month}/${_dateTime.year}";
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class TransactionTypeOption {
  String label;
  TransactionType type;
  Color color;

  TransactionTypeOption(this.label, this.type, this.color);
}



// import 'package:flutter/material.dart';
// import 'package:four_finance_app/src/models/transaction.dart';
// import 'package:four_finance_app/src/ui/pages/new_transaction/new_transaction_item.dart';
// // import 'package:four_finance_app/src/ui/pages/new_transaction/new_transaction_item.dart';
//
// class NewTransactionPage extends StatefulWidget {
//   const NewTransactionPage({super.key
//       // required this.transaction,
//       });
//
//   // final Transaction transaction;
//
//   @override
//   State<NewTransactionPage> createState() => _NewTransactionPage();
// }
//
// class _NewTransactionPage extends State<NewTransactionPage> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             Row(
//                 // Desenvolver aqui
//                 ),
//             // Column(
//             //   children: [
//             //     // Row(),
//             //     Row(
//             //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //       children: <Widget>[
//             //         // const SizedBox(width: 1),
//             //         Align(
//             //           alignment: Alignment.bottomRight,
//             //           widthFactor: 6.2,
//             //           heightFactor: 15.0,
//             //           child: FloatingActionButton(
//             //             onPressed: () {
//             //               // print('Clicou');
//             //               dialogTransaction(context);
//             //             },
//             //             child: const Icon(Icons.add),
//             //           ),
//             //         )
//             //       ],
//             //     )
//             //   ],
//             // )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> dialogTransaction(BuildContext context) {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           insetPadding: const EdgeInsets.symmetric(horizontal: 1, vertical: 20),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Lançar Conta',
//                     style: TextStyle(
//                       color: Colors.amber[700],
//                       fontSize: 30.0,
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: const [
//                   Divider(
//                     height: 25,
//                     thickness: 1,
//                     indent: 5,
//                     endIndent: 0,
//                     color: Colors.black,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
// // void cardTransaction(BuildContext context) {
// //   List<String> financialReleasesList = Transaction().financialRelease;
// //   String dropdownValue = financialReleasesList.first;
//
// //   showDialog(
// //     context: context,
// //     builder: (context) => SingleChildScrollView(
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           Container(
// //             decoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(4),
// //               color: Colors.blue[900],
// //             ),
// //             child: Row(
// //               children: [
// //                 DropdownButton<String>(
// //                   value: dropdownValue,
// //                   icon: const Icon(Icons.arrow_drop_down_circle),
// //                   elevation: 16,
// //                   style: TextStyle(
// //                     color: Colors.amber[800],
// //                   ),
// //                   underline: Container(
// //                     height: 2,
// //                     color: Colors.amber[800],
// //                   ),
// //                   onChanged: (String? value) {
// //                     setState(() {
// //                       dropdownValue = value!;
// //                     });
// //                   },
// //                   items: financialReleasesList
// //                       .map<DropdownMenuItem<String>>((String value) {
// //                     return DropdownMenuItem<String>(
// //                       value: value,
// //                       child: Text(value),
// //                     );
// //                   }).toList(),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     ),
// //   );
// // }
// }
