import 'package:flutter/material.dart';

class WrapDemo extends StatelessWidget {
  const WrapDemo({super.key});

  @override
  Widget build(BuildContext context) {
    //это сразу и ряд, и колонка
    return Wrap(
      direction: Axis.vertical,
      spacing: 16, //отступ между рядами (так как ориентация вертикальная)
      runSpacing: 16, // отступ между колонками
      children: [
        Container(
          color: Colors.red,
          width: 200,
          height: 200,
          child: const Center(
            child: Text(
              "W1",
              textScaleFactor: 2,
            ),
          ),
        ),
        Container(
          color: Colors.orange,
          width: 200,
          height: 200,
          child: const Center(
            child: Text(
              "W2",
              textScaleFactor: 2,
            ),
          ),
        ),
        Container(
          color: Colors.green,
          width: 200,
          height: 200,
          child: const Center(
            child: Text(
              "W3",
              textScaleFactor: 2,
            ),
          ),
        ),
        Container(
          color: Colors.blue,
          width: 200,
          height: 200,
          child: const Center(
            child: Text(
              "W4",
              textScaleFactor: 2,
            ),
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 8, 57, 142),
          width: 200,
          height: 200,
          child: const Center(
            child: Text(
              "W5",
              textScaleFactor: 2,
            ),
          ),
        ),
        Container(
          color: Colors.purple,
          width: 200,
          height: 200,
          child: const Center(
            child: Text(
              "W6",
              textScaleFactor: 2,
            ),
          ),
        ),
      ],
    );
  }
}
