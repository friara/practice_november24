import 'package:demo_clean_architecture/core/di/configure_dependencies.dart';
import 'package:demo_clean_architecture/feature/color/presentation/page/color_page.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const ColorPage(),
        '/second': (context) => const ColorPage()
      },
    );
  }
}
