import 'package:flutter/material.dart';
import 'package:lesson4_layout_widgets/column_demo.dart';
import 'package:lesson4_layout_widgets/container_demo.dart';
import 'package:lesson4_layout_widgets/expanded_demo.dart';
import 'package:lesson4_layout_widgets/listview_demo.dart';
import 'package:lesson4_layout_widgets/row_demo.dart';
import 'package:lesson4_layout_widgets/stack_demo.dart';
import 'package:lesson4_layout_widgets/wrap_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
//       home: Scaffold(
//           backgroundColor: Colors.white,
//           body: LayoutBuilder(
//             builder: ((context, constraints) {
//               return Row(
//                 children: [
//                   if (constraints.maxWidth > 800) ...[
//                     Container(
//                       width: 200,
//                       height: 200,
//                       color: Colors.amber,
//                     ),
//                     Container(
//                       width: 200,
//                       height: 200,
//                       color: Colors.green,
//                     ),
//                   ] else
//                     Container(
//                       width: 300,
//                       height: 300,
//                       color: Colors.red,
//                     ),
//                 ],
//               );
//             }),

      home: ListviewDemo(),
    );

//           )

//           // home: Scaffold(
//           //   backgroundColor: Colors.white,
//           //   body: WrapDemo(),

//           //home: ListviewDemo(),

//           // home: Center(
//           //   child: ContainerDemo(),
//           //),
//           //),
//     ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: ContainerDemo()));
  }
}
