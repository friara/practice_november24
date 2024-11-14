import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpandedDemo extends StatelessWidget {
  const ExpandedDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center, //выравнивание по центру
      mainAxisAlignment:
          MainAxisAlignment.spaceAround, //выравнивание по вертикали
      children: [
        Expanded(
            // заполняет все пространство собой
            flex:
                2, //стоимость (вес), можно и в процентах прописать (70 - 70 %)
            child: Container(
              color: Colors.red,
            )),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.amber,
          ),
        )
      ],
    );
  }
}
