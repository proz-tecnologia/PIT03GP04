// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:four_finance_app/src/models/transaction.dart';

class TransactionItem extends StatefulWidget {
  TransactionItem({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
    );
  }

  // void cardTransaction(BuildContext context) {
  //   List<String> financialReleasesList = transaction.financialRelease;

  //   showDialog(
  //     context: context,
  //     builder: (context) => Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Container(
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(4),
  //             color: Colors.blue[900],
  //           ),
  //           child: Row(
  //             children: [
  //               DropdownButton<String>(
  //                   value: financialReleasesList,
  //                   icon: const Icon(Icons.arrow_drop_down_circle),
  //                   elevation: 16,
  //                   style: TextStyle(
  //                     color: Colors.amber[800],
  //                   ),
  //                   underline: Container(
  //                     height: 2,
  //                     color: Colors.amber[800],
  //                   ),
  //                   onChanged: (String? value) {
  //                     setState(() {
  //                       financialReleasesList = value!;
  //                     });
  //                   },
  //                   items: financialReleasesList.map),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
