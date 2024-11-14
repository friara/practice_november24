import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lesson5_nullsafety/future_page.dart';

void main() {
  //runApp(const MainApp());

  //runApp(const FuturePage());  
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

const count = 5;
void baseExample() {
  print('count = $count');

  var countVar = 5;
  countVar++;
  print('countVar = ${countVar.runtimeType}'); //тип переменной
  print('countVar = $countVar');

  final List<int> list = [];
  list.add(1);
  print(list);
}

class User {
  int? age;
  String? name;

  //final String _lastname; // внутренняя переенная,
  //которая не будет использоваться вне этого класс

  User({this.age, this.name});
}

void nullSafetyExample() {
  int? count = 5;
  count = null;

  int num = count ?? 0; // вернет 5

  User? user;
  user?.age = 5; // если user.age = null, то присваиваем ему 5

  User? user2 = User();
  user
    ?..age = 5 //каскадный оператор
    ..name = "Nika";

  late final int count1;
  count1 =
      10; //самое главное не обратиться к этой переменной до того, как ее инициализируем
}

//пример нечастого, но использования типа Never в коде
Never valueIsNotDefined() {
  throw ArgumentError('Value is not defined');
}

int method(int? value) {
  if (value == null) return valueIsNotDefined();
  return value;
}

void collectionsExample() {
  final list = <String>['Item1', 'Item2', 'Item3'];
  final list1 = List<String>.empty(
      growable:
          true); //пустой список, в который можно что-то добавлять (growable: true)

  //хранилище для keys
  final map = {
    'key1': 'value1',
    'key2': 'value2',
  };
  print(map['key1']);
}

//картежи или рекордс (используется в основном в функциях где много параметров, что бы выглядело симпатично)
void recordsExample() {
  var person = ("Tom", 38);
  print(person.$1); // Tom
  print(person.$2); // 38

  (String, int, int) item1 = ("Tom", 32, 23);
  print(item1);

  ({String name, int age}) item2 = (name: "Tom", age: 32);
  print(item2.age);
}

void asyncExample() async {
  final result = Future<String>(() async {
    return 'String';
  });

  print(result);

  /*
  print('start main');  // 1 действие
  Future(() => print(1));   // 4 ( тк это ивент)
  Future.microtask(() => print(2));   // 3 ( тк это микротаск)
  print('end main');  // 2
  */
}

void asyncExercise() {
  print('start main'); // 1 действие - 'statrt main'
  Future(() => print('future1')).then((value) {
    // 5 - 'future1', 6 - 'then1'
    print('then1');
    Future(() => print('nested future')); // 9 - 'nested future'
  });

  Future.sync(() => print('future sync')).then((value) =>
      print('then sync')); // 2 действие - 'future sync', 4 - 'then sync'
  Future(() => print('future 2'))
      .then((value) => print('then 2')); // 7 - 'future 2', 8 - 'then 2'
  print('end main'); // 3 - 'end main'
}

Future<void> calc() async {
  print('calc');

  Future.delayed(const Duration());
}

void streamExample() async {
  var controller = StreamController<String>();

  final subscription = controller.stream.listen((event) {
    print(event);
  });

  await Future.delayed(const Duration(seconds: 1));
  controller.add('String 1');
  await Future.delayed(const Duration(seconds: 1));
  controller.add('String 2');
  await Future.delayed(const Duration(seconds: 1));
  subscription.cancel();
}
