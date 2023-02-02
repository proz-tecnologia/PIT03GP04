import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:four_finance_app/widget/card_result.dart';

void main() {
  testWidgets("Validate buttons", (widgetTester) async {
    await widgetTester
        .pumpWidget(const MaterialApp(home: Material(child: CardResult())));

    expect(find.text('Entrada'), findsOneWidget);
    expect(find.text('Saída'), findsOneWidget);
    expect(find.text('Resultado'), findsOneWidget);
    expect(find.byType(Divider), findsOneWidget);
  });
}
