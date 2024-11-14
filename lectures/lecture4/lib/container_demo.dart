import 'dart:math';

import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueAccent,
        width: 300,
        height: 300,
        foregroundDecoration: BoxDecoration(
            color: Colors.pink.withAlpha(
                100)), // поверх главного контейнера и его childa наложил свой цвет
        constraints: const BoxConstraints(
            maxHeight: 200,
            maxWidth:
                200), //ограничение размеров контейнера (дочерние также подстроятся)
        padding: const EdgeInsets.all(30), //отстуа внутри контейнера
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.amber,
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey,
                  offset: Offset(10, 20),
                )
              ],
              gradient: LinearGradient(colors: [Colors.yellow, Colors.red]),
              // в LinearGradient есть точки откуда - куда перемещается градиент, а также вместо можно use RadialGradient
              borderRadius:
                  BorderRadius.all(Radius.circular(16))), //скругление углов
          transform: Matrix4.skewY(0.3)..rotateZ(pi / 5),
        ));
  }
}
