import 'package:calendar_ver1/core/di/configure_dependencies.dart';
import 'package:calendar_ver1/presentations/pages/calendarPage.dart';
import 'package:calendar_ver1/presentations/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  configureDependencies();
  initializeDateFormatting().then((_) => runApp(const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage()
    );
  }
}
