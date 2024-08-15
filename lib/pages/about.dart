import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  AppBar myAppBar() {
    return AppBar(
      title: const Text("About"),
      titleTextStyle: const TextStyle(
          fontSize: 63,
          fontWeight: FontWeight.w800,
          color: Color.fromRGBO(41, 98, 255, 1),
          fontFamily: "Krub"),
      automaticallyImplyLeading: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "About!",
            style: TextStyle(
                fontSize: 60, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ],
      )),
      bottomNavigationBar: const SizedBox(
          child: BottomAppBar(child: Center(child: Text("Version: ")))),
    );
  }
}
