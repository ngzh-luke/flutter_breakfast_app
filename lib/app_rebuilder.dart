// // https://hillel.dev/2018/08/15/flutter-how-to-rebuild-the-entire-app-to-change-the-theme-or-locale/
// import 'package:flutter/material.dart';

// class AppBuilder extends StatefulWidget {
//   final Function(BuildContext) builder;

//   const AppBuilder(
//       {Key key, this.builder})
//       : super(key: key);

//   @override
//   AppBuilderState createState() => AppBuilderState();

//   static AppBuilderState of(BuildContext context) {
//     return context.ancestorStateOfType(const TypeMatcher<AppBuilderState>());
//   }
// }

// class AppBuilderState extends State<AppBuilder> {

//   @override
//   Widget build(BuildContext context) {
//     return widget.builder(context);
//   }

//   void rebuild() {
//     setState(() {});
//   }
// }