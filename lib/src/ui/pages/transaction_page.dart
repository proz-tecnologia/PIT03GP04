import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:four_finance_app/src/models/transaction.model.dart';
import 'package:four_finance_app/widget/drawer_page.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class TransactionPage extends StatefulWidget {
  TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _NewTransactionPageState();
}

class _NewTransactionPageState extends State<TransactionPage> {
  //Aqui instanciamos a HOME CONTROLLER q vai ter a lisata OBSERVEBLE
  //Instanciamos a HOME CONTROLLER

  final _transactionTypes = [
    TransactionTypeOption("Receita", TransactionType.INCOME, Colors.green),
    TransactionTypeOption("Despesa", TransactionType.EXPENSE, Colors.red)
  ];

  final _formKey = GlobalKey<FormState>();

  var _transactionType = TransactionType.INCOME;
  var _value = 0.0;
  var _description = "";
  var _dateTime = DateTime.now();

  final _txtDateTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lançamento"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        drawer: const DrawerView(),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      height: 32,
                    ),
                    TextFormField(
                      // onChanged: modelTransaction,
                      decoration: const InputDecoration(
                          labelText: "Descrição",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)))),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: Validatorless.multiple([
                        Validatorless.required('Campo descrição obrigatório.'),
                        Validatorless.min(5, 'No minímo 5 caracteres'),
                        Validatorless.max(30, 'No máximo 30 carcteres')
                      ]),
                      onSaved: ((newValue) => _description = newValue!),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        CurrencyTextInputFormatter(
                            locale: "pt_BR", decimalDigits: 2, symbol: '')
                      ],
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          labelText: "Valor",
                          hintText: "0,00",
                          prefix: Text("R\$  ")),
                      validator: Validatorless.multiple([
                        Validatorless.required('Campo valor obrigatório'),
                        Validatorless.min(1, 'No minímo 1 caracter'),
                        Validatorless.max(10, 'No máximo 10 caracteres')
                      ]),
                      onSaved: (newValue) => _value = double.parse(
                          newValue!.replaceAll('.', '').replaceAll(',', '.')),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: _txtDateTimeController,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                          labelText: "Data da Operação",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)))),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator:
                          Validatorless.required('Campo data obrigatório'),
                      /*validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe uma data.";
                  }
                  return null;
                },*/
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        DateTime? date = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 360)),
                            lastDate: DateTime.now(),
                            initialDate: _dateTime);
                        _dateTime = date ?? _dateTime;
                        _txtDateTimeController.text =
                            "${_dateTime.day}/${_dateTime.month}/${_dateTime.year}";
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Lançar')),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/home');
                            },
                            child: Text('Cancelar'))
                      ],
                    ),
                  ]),
            ),
          ),
        ));
  }
}

class TransactionTypeOption {
  String label;
  TransactionType type;
  Color color;

  TransactionTypeOption(this.label, this.type, this.color);
}
