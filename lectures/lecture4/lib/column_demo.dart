import 'package:flutter/material.dart';

class ColumnDemo extends StatelessWidget {
  const ColumnDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center, //выравнивание по центру
      mainAxisAlignment:
          MainAxisAlignment.spaceAround, //выравнивание по вертикали
      // crossAxisAlignment:
      //     CrossAxisAlignment.center, // выравнивание по горизонтали
      // mainAxisSize: MainAxisSize
      //     .min, //будет ли занимать ряд все свободное пространство, не важно сколько у него child-ов
      children: [
        Container(width: 100, height: 100, color: Colors.amber),
        Container(width: 100, height: 100, color: Colors.orange),
        Container(width: 100, height: 100, color: Colors.red)
      ],
    );
  }
}
