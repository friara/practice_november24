import 'package:flutter/material.dart';
import 'package:lecture13/user/user.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final birthday = DateTime.now();
    UserModel user1 = UserModel(login: 'user', firstName: 'aaa', lastName: 'bbb', birthday: birthday);
    UserModel user2 = UserModel(login: 'user', firstName: 'aaa', lastName: 'bbb', birthday: birthday);

    print(user1 == user2);
    print(UserModel.fromJson(user2.toJson()));
    user1 = user1.copyWith(firstName: 'Alexander');

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(user1.toString()),
        ),
      ),
    );
  }
}
