import 'package:flutter/material.dart';

void main() {
  
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: const Text('My App'),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
    ),
    body: const ColorContainer2(color: Colors.pink),
    floatingActionButton:
        IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
  )));

  // MaterialApp - виджет, который включает в себя такие фичи, как маршрутизация, навигация, локализация
  // runApp(const MaterialApp(
  //   home: ColorContainer2(
  //     color: Colors.pink
  //     ),
  // )
  // );
}

// //создание своего контейнера
// class ColorContainer extends StatelessWidget {
//   const ColorContainer({super.key, required this.color});

//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: color,
//     );
//   }
// }

//создание виджета, при нажатии на который меняется цвет
class ColorContainer2 extends StatefulWidget {
  const ColorContainer2({super.key, required this.color});

  final Color color;

  @override
  State<ColorContainer2> createState() => _ColorContainerState();
}

class _ColorContainerState extends State<ColorContainer2> {
  late Color color;

  double textSize = 14;

  @override
  void initState() {
    super.initState();
    color = widget
        .color; 
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          color = Colors.yellow;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: color,
            //child: Image.asset('assets/dance-happy-dance.gif')),
            child: Center(
              child: Text(
                'My App',
                style: TextStyle(
                    fontFamily: 'Monsterrat-Medium', fontSize: textSize),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  textSize += 2;
                });
              },
              child: const Text('Увеличить')),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  textSize -= 2;
                });
              },
              child: const Text('Уменшить')),
        ],
      ),
    );
  }
}
