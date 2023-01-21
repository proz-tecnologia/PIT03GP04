import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:four_finance_app/Transaction/controller/transaction.controller.dart';
import 'package:four_finance_app/widget/drawer_page.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../models/transaction.model.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _NewTransactionPageState();
}

class _NewTransactionPageState extends State<TransactionPage> {
  final _transactionTypes = [
    TransactionTypeOption("Receita", TransactionType.INCOME, Colors.green),
    TransactionTypeOption("Despesa", TransactionType.EXPENSE, Colors.red)
  ];

  final _formKey = GlobalKey<FormState>();

  var _transactionType = TransactionType.INCOME;
  var _valueTransaction = 0.0;
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _transactionTypes
                    .map(
                      (e) => ChoiceChip(
                          selectedColor: e.color,
                          labelStyle: const TextStyle(color: Colors.white),
                          label: Container(
                              alignment: AlignmentDirectional.center,
                              width: 180,
                              height: 60,
                              child: Text(e.label)),
                          selected: e.type == _transactionType,
                          onSelected: (value) => setState(() {
                                _transactionType = e.type;
                              })),
                    )
                    .toList(),
              ),
              const SizedBox(height: 32),
              TextFormField(
                // onChanged: modelTransaction,
                decoration: const InputDecoration(
                  labelText: "Descrição",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('Campo descrição obrigatório.'),
                  Validatorless.min(5, 'No minímo 5 caracteres'),
                  Validatorless.max(30, 'No máximo 30 carcteres')
                ]),
                onSaved: ((newValue) => _description = newValue!),
              ),
              const SizedBox(height: 32),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  CurrencyTextInputFormatter(
                      locale: "pt_BR", decimalDigits: 2, symbol: '')
                ],
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    labelText: "Valor",
                    hintText: "0,00",
                    prefix: Text("R\$  ")),
                validator: Validatorless.multiple([
                  Validatorless.required('Campo valor obrigatório'),
                  Validatorless.min(1, 'No minímo 1 caracter'),
                  Validatorless.max(10, 'No máximo 10 caracteres')
                ]),
                onSaved: (newValue) => _valueTransaction = double.parse(
                    newValue!.replaceAll('.', '').replaceAll(',', '.')),
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: _txtDateTimeController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  labelText: "Data da Operação",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                validator: Validatorless.required('Campo data obrigatório'),
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
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 190,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          final newTransaction = Transaction(
                              transactionType: _transactionType,
                              dateTime: _dateTime,
                              description: _description,
                              valueTransaction: _valueTransaction);
                          //Todo: Chamando o PROVEDIR da TRANSACTIONCONTROLLER q possui as açoes
                          Provider.of<TransactionController>(context,
                                  listen: false)
                              .add(newTransaction);
                          // print(newTransaction);

                          Navigator.of(context)
                              .pushReplacementNamed('/transaction');
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(90),
                          ),
                        ),
                      ),
                      child: const Text('Lançar'),
                    ),
                  ),
                  SizedBox(
                    width: 190,
                    height: 60,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/home');
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(90),
                            ),
                          ),
                        ),
                        child: const Text('Cancelar')),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

//Todo: Tipo de transação
class TransactionTypeOption {
  String label;
  TransactionType type;
  Color color;

  TransactionTypeOption(this.label, this.type, this.color);
}
