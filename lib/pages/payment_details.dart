import 'package:flutter/material.dart';
import 'package:flutter_breakfast_app/models/payment_partners_model.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key, required this.partners});
  final PaymentPartnersModel partners;

  AppBar myAppBar() {
    return AppBar(
      title: Text(partners.name),
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
        child: SizedBox(
          height: 120,
          width: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(partners.icon),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Center(child: Text("Paid via: ")),
                  Center(child: Text(partners.name)),
                ]),
                const Text('Details: '),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
