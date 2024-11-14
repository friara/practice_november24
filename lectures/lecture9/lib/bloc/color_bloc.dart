import 'package:demo_state_manage/util.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() :super(const ColorInitialState()) {
    on<NewColorEvent>((event, emit) {
      onNewColorEvent(event, emit);
    });
    on<ResetColorEvent>((event, emit) {
      onResetColorEvent(event, emit);
    });
    on<NewRandomColorEvent>((event, emit){ 
      onNewRandomColorEvent(event, emit);
      });
  
  }

  void onNewColorEvent(NewColorEvent event, Emitter<ColorState> emitter) {
    emitter(ColorCurrentState(event.color));
  }

  void onNewRandomColorEvent(NewRandomColorEvent event, Emitter<ColorState> emitter) {
    emitter(ColorCurrentState(Util.randomColor()));
  }

  void onResetColorEvent(ResetColorEvent event, Emitter<ColorState> emitter) {
    emitter(const ColorInitialState());
  }
}