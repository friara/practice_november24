import 'package:demo_clean_architecture/feature/color/presentation/cubit/color_cubit.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ColorPage extends StatelessWidget {
const ColorPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ColorCubit>.value(
      value: GetIt.I(),
      child: Scaffold(
        body: SafeArea(child: Center(
          child: BlocBuilder<ColorCubit, ColorState> (
            buildWhen: (previouse, current) {
                return true;
            },
            builder: ( (context, state) {
                if(state.isLoading) {
                    return const Center(
                        child: CircularProgressIndicator(),
                    );
                }

            return Column(
              children: [
                if(state.error.isNotEmpty) Text('Error! ${state.error}'),
                
                Container(
                    width: 200,
                    height: 200,
                    color: state.color,
                    child: Column(
                      children: [
                        Text(state.color.toString()),
                        
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/second');
                        }, child: const Text('Second Page'))
                      ],
                              ),
                  ),
                ColorPicker(
                  color: state.color,
                  onColorChanged: (color) {
                    context.read<ColorCubit>().setColor(color);
                })
              ],
            );
          })),
        )),
      ),);
  }
}