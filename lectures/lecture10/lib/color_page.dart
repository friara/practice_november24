import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lecture10/bloc/color_bloc.dart';
import 'package:lecture10/bloc/color_event.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => ColorBloc(),
        child: Center(child: BlocBuilder<ColorBloc, Color>(
          builder: (context, state) {
            return Container(
              width: 200,
              height: 200,
              color: state,
              child: Column(
                children: [
                  Text(state.toString()),
                  ElevatedButton(
                      onPressed: () {
                        context.read<ColorBloc>().add(ColorChangePressed());
                      },
                      child: const Text('Change color'))
                ],
              ),
            );
          },
        )),
      ),
    );
  }
}