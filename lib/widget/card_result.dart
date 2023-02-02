import 'package:flutter/material.dart';
import 'package:four_finance_app/extension/extension.double.dart';

class CardResult extends StatelessWidget {
  final double incomingValue;
  final double outcomingValue;

  const CardResult(
      {super.key, this.incomingValue = 0, this.outcomingValue = 0});

  double get total => incomingValue - outcomingValue;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        elevation: 4,
        margin: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Entrada",
                  style: TextStyle(color: Colors.green, fontSize: 20),
                ),
                Text(
                  incomingValue.formatBRL,
                  style: TextStyle(color: Colors.green, fontSize: 20),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Saída",
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
                Text(
                  "- ${outcomingValue.formatBRL}",
                  style: TextStyle(color: Colors.red, fontSize: 20),
                )
              ],
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Resultado",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  (incomingValue - outcomingValue).formatBRL,
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ]),
        ));
  }
}
