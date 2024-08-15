import 'package:flutter/material.dart';
import 'package:flutter_breakfast_app/models/upcoming_transactions.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({super.key, required this.transaction});
  final UpcomingTransactions transaction;

  AppBar myAppBar() {
    return AppBar(
      title: Text(transaction.transaction),
      // title: Icon(partners.icon),
      titleTextStyle: const TextStyle(
          fontSize: 33,
          fontWeight: FontWeight.w800,
          color: Color.fromRGBO(41, 98, 255, 1),
          fontFamily: "Krub"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(transaction.icon),
            Row(
              children: [
                const Text("Amount: "),
                Text((transaction.amount.toString())),
              ],
            ),
            Row(
              children: [
                const Text("Details: "),
                Text((transaction.transactionDetails))
              ],
            ),
            Row(
              children: [
                const Text('Tag:'),
                Text((transaction.transactionDetails))
              ],
            )
          ],
        ),
      )),
    );
  }
}
