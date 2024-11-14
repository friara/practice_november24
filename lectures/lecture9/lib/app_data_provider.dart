import 'package:demo_state_manage/app_data.dart';
import 'package:flutter/material.dart';

class AppDataProvider extends InheritedWidget {
  final AppData appData;

  AppDataProvider({required this.appData, required super.child});

  static AppDataProvider? of(BuildContext context) => 
    context.dependOnInheritedWidgetOfExactType<AppDataProvider>();
  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}