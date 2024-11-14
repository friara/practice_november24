import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          color: Colors.red,
        ),
        Container(
          width: 160,
          height: 160,
          color: Colors.orange,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.yellow,
          ),
        )
      ],
    );
  }
}
