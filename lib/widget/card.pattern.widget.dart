import 'package:flutter/material.dart';
import 'package:four_finance_app/extension/extension.double.dart';

class CardPattern extends StatelessWidget {
  final double _valueAcconunt;
  final Color color;
  final Text text;

  const CardPattern(this.text, this.color, this._valueAcconunt, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      margin: EdgeInsets.all(16),
      elevation: 16,
      shadowColor: Colors.black,
      child: Container(
        color: color,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            text,
            const Divider(
              color: Colors.black,
              thickness: 1,
            ),
            Center(
              child: Text(_valueAcconunt.formatBRL),
            ),
          ],
        ),
      ),
    );
  }
}
