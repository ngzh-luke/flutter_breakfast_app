// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breakfast_app/pages/about.dart';
import 'package:flutter_breakfast_app/pages/landing.dart';
import 'package:flutter_breakfast_app/pages/transaction_details.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_breakfast_app/models/payment_partners_model.dart';
import 'package:flutter_breakfast_app/models/upcoming_transactions.dart';
import 'package:flutter_breakfast_app/pages/payment_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PaymentPartnersModel> paymentMethods = [];
  List<UpcomingTransactions> transactions = [];

  void _getPaymentMethod() {
    paymentMethods = PaymentPartnersModel.getCategories();
  }

  void _getTransaction() {
    transactions = UpcomingTransactions.getTransactions();
  }

  @override
  // ignore: must_call_super
  void initState() {
    _getPaymentMethod();
    _getTransaction();
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initState();
    return Scaffold(
      appBar: appBar(),
      body: myHomePageContent(),
      backgroundColor: Colors.lightBlue[50],
    );
  }

  ListView myHomePageContent() {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _searchBox(),
        const SizedBox(
          height: 22,
        ),
        _paymentMethodsSection(),
        const SizedBox(
          height: 22,
        ),
        _upcomingTransactionsSection()
      ],
    );
  }

  Column _upcomingTransactionsSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Text(
            "Upcoming Transactions",
            style: TextStyle(
                color: Colors.red[700],
                fontWeight: FontWeight.w900,
                fontSize: 26),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SizedBox(
            height: 300,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 9),
              itemCount: transactions.length,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(top: 12, bottom: 13),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TransactionDetails(
                                  transaction: transactions[index],
                                )));
                  },
                  child: Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(22)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FaIcon(transactions[index].icon),
                                  Text(
                                    transactions[index].transaction,
                                    style: TextStyle(
                                        color: Colors.blue[900],
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 20),
                                  ),
                                ]),
                          ),
                        ),
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Due: ",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text((transactions[index].dueDateTime)
                                          .toString()),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "Amount: ",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text((transactions[index].amount)
                                          .toString()),
                                      const Text("฿"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "#",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          (transactions[index].tag).toString()),
                                    ],
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }

  Column _paymentMethodsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Text(
              AppLocalizations.of(context)!.paymentMethod,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 26),
            )),
        const SizedBox(
          height: 11,
        ),
        SizedBox(
          height: 110,
          child: ListView.separated(
              itemCount: paymentMethods.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20),
              separatorBuilder: (context, index) => const SizedBox(
                    width: 25,
                  ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentDetails(
                                  partners: paymentMethods[index],
                                )));
                  },
                  child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                        color: paymentMethods[index].boxColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: Colors.black12, shape: BoxShape.circle),
                            child: FaIcon(paymentMethods[index].icon),
                          ),
                          Text(
                            paymentMethods[index].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline),
                          )
                        ]),
                  ),
                );
              }),
        )
      ],
    );
  }

  Container _searchBox() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.11),
            blurRadius: 41,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        style: const TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 22.2,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange),
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            contentPadding: const EdgeInsets.all(14),
            hintText: "Search...",
            hintStyle:
                const TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.8),
              child: SvgPicture.asset('assets/icons/search.svg'),
            ),
            suffixIcon: SizedBox(
              width: 120,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 33,
                      child: VerticalDivider(
                        color: Colors.blueGrey[200],
                        thickness: 0.85,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset('assets/icons/funnel-fill.svg'),
                    ),
                  ],
                ),
              ),
            ), // filter icon & vertical bar
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(19),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        "Breakfast",
        style: TextStyle(
            color: Colors.amber, fontSize: 30, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.deepPurpleAccent,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Landing()));
        },
        child: Container(
          margin: const EdgeInsets.all(11),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset('assets/icons/arrow-left-circle.svg'),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const About()));
          },
          child: Container(
            // alignment: Alignment.center,
            margin: const EdgeInsets.all(11),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset(
              'assets/icons/three-dots-vertical.svg',
              height: 29,
              width: 29,
            ),
          ),
        ),
      ],
    );
  }
}
