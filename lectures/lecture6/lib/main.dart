import 'package:flutter/material.dart';
import 'package:lesson6_navigation/app_2.dart';
//import 'package:lesson6_navigation/app_1.dart';
//import 'package:lesson6_navigation/app_3.dart';

void main() {
  //runApp(const App1());
  //runApp(const App2());
  runApp(const App2());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
