import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lecture10/util.dart';

import 'color_event.dart';

class ColorBloc extends Bloc<ColorEvent, Color> {
  ColorBloc() : super(Colors.green) {
    on<ColorChangePressed>(
      (event, emit) => emit(Util.randomColor()),
    );
  }
}