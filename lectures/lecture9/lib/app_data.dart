import 'package:flutter/material.dart';

class AppData with ChangeNotifier{
  Color backgroundColor;
  
  AppData({required this.backgroundColor});

  void changeBackgroundColor(Color color) {
    backgroundColor = color;
    notifyListeners();
  }
}
class AppData1 with ChangeNotifier {
  Color backgroundColor;
  
  AppData1({required this.backgroundColor});

  void changeBackgroundColor(Color color) {
    backgroundColor = color;
    notifyListeners();
  }
}