// import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';

class UpcomingTransactions {
  String transaction;
  IconData icon;
  String dueDateTime;
  String transactionDetails;
  bool viewIsSelected;
  double amount;
  String tag;

  UpcomingTransactions(
      {required this.transaction,
      required this.icon,
      required this.transactionDetails,
      required this.dueDateTime,
      required this.tag,
      required this.amount,
      required this.viewIsSelected});

  static List<UpcomingTransactions> getTransactions() {
    List<UpcomingTransactions> transactions = [];

    transactions.add(UpcomingTransactions(
        transaction: "Docker course",
        icon: FontAwesomeIcons.docker,
        transactionDetails: "To master Docker!!!",
        dueDateTime: "Today@19:00",
        tag: "development",
        amount: 2000.0,
        viewIsSelected: true));
    transactions.add(UpcomingTransactions(
        transaction: "Docker book",
        icon: FontAwesomeIcons.book,
        transactionDetails: "Docker textbook+cheatsheet",
        dueDateTime: "Today@19:10",
        tag: "development",
        amount: 200,
        viewIsSelected: false));
    transactions.add(UpcomingTransactions(
        transaction: "House rental",
        icon: CupertinoIcons.house,
        transactionDetails: "",
        amount: 5600,
        dueDateTime: "Tomorrow before 22:00",
        tag: "living cost",
        viewIsSelected: false));
    return transactions;
  }
}
