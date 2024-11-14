import 'package:flutter/material.dart';

const double textSize = 50;

class ListviewDemo extends StatelessWidget {
  const ListviewDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //itemExtent: , - ускоряет работу листа, если все элементы одинакового размера
      itemCount: 100,
      itemBuilder: (context, index) {
        print(index);
        return Text("Item # $index");
      },
    );

    // return ListView.separated(
    //   padding: const EdgeInsets.all(80),
    //   itemCount: 5,
    //   separatorBuilder: (context, index) => const Divider(
    //     thickness: 5,
    //   ),
    //   itemBuilder: (context, index) => Text("Item # $index"),
    // );

    // return ListView(
    //   //scrollDirection: Axis.horizontal,  //скрол горизонтальный
    //   children: [
    //     Text("Tom", style: TextStyle(fontSize: textSize)),
    //     Container(height: 300, width: 300, color: Colors.amber),
    //     Text("Alica", style: TextStyle(fontSize: textSize)),
    //     Text("Nika", style: TextStyle(fontSize: textSize)),
    //     Text("Andrey", style: TextStyle(fontSize: textSize)),
    //     Text("Ivan", style: TextStyle(fontSize: textSize)),
    //     Text("Olga", style: TextStyle(fontSize: textSize)),
    //     Text("Danila", style: TextStyle(fontSize: textSize)),
    //     Text("Lena", style: TextStyle(fontSize: textSize)),
    //     Text("Roman", style: TextStyle(fontSize: textSize)),
    //     Text("Nikita", style: TextStyle(fontSize: textSize)),
    //     Text("Igor", style: TextStyle(fontSize: textSize)),
    //     Text("Tomara", style: TextStyle(fontSize: textSize)),
    //     Text("Roman", style: TextStyle(fontSize: textSize)),
    //     Text("Nikita", style: TextStyle(fontSize: textSize)),
    //     Text("Igor", style: TextStyle(fontSize: textSize)),
    //     Text("Tomara", style: TextStyle(fontSize: textSize)),
    //   ],
    // );
  }
}
