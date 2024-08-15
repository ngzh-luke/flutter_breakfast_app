import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentPartnersModel {
  String name;
  IconData icon;
  Color boxColor;

  PaymentPartnersModel({
    required this.name,
    required this.icon,
    required this.boxColor,
  });

  static List<PaymentPartnersModel> getCategories() {
    List<PaymentPartnersModel> categories = [];

    categories.add(PaymentPartnersModel(
        name: "Cash",
        icon: FontAwesomeIcons.moneyBill1Wave,
        boxColor: Colors.white));
    categories.add(PaymentPartnersModel(
        name: 'Alipay',
        icon: FontAwesomeIcons.alipay,
        boxColor: const Color.fromRGBO(41, 121, 255, 1)));
    categories.add(PaymentPartnersModel(
        name: 'WeChat Pay',
        icon: FontAwesomeIcons.weixin,
        boxColor: Colors.green));
    categories.add(PaymentPartnersModel(
        name: 'Credit card',
        icon: FontAwesomeIcons.creditCard,
        boxColor: const Color.fromRGBO(255, 209, 128, 1)));
    categories.add(PaymentPartnersModel(
        name: 'Amazon Pay',
        icon: FontAwesomeIcons.ccAmazonPay,
        boxColor: const Color.fromRGBO(255, 235, 59, 1)));
    categories.add(PaymentPartnersModel(
        name: 'Apple Pay',
        icon: FontAwesomeIcons.ccApplePay,
        boxColor: Colors.black38));
    categories.add(PaymentPartnersModel(
        name: 'Paypal',
        icon: FontAwesomeIcons.ccPaypal,
        boxColor: const Color.fromRGBO(144, 202, 249, 1)));

    return categories;
  }
}
