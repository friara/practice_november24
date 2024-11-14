import 'package:demo_clean_architecture/feature/color/domain/entity/color_entity.dart';
import 'package:demo_clean_architecture/feature/color/domain/entity/color_falure.dart';
import 'package:demo_clean_architecture/feature/color/domain/usecase/get_color_use_case.dart';
import 'package:demo_clean_architecture/feature/color/domain/usecase/select_color_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'color_state.dart';

class ColorCubit extends Cubit<ColorState> {
  ColorCubit(this._getColorUseCase, this._selectColorUseCase) 
  : super(ColorCurrentState(color: Colors.transparent, isLoading: true)) {
    getColor();
  }

  final GetColorUseCase _getColorUseCase;
  final SelectColorUseCase _selectColorUseCase;

  Future<void> getColor() async {
    emit(ColorCurrentState(color: state.color, isLoading: true));

    final result = await _getColorUseCase();

    return result.fold(
      (failure) => emit(ColorCurrentState(
        color: state.color, 
        isLoading: false, error: 
        failure.getLocalizedString())), 
      (entity) => emit(ColorCurrentState(
        color: Color(
          int.tryParse(entity.color) ?? 0xFFFFFFF), 
        isLoading: false)));
  }

  Future<void> setColor(Color color) async {
    emit(ColorCurrentState(color: state.color, isLoading: true));

    final result = await _selectColorUseCase(ColorEntity(color: color.toString()));

    return result.fold(
      (failure) => emit(ColorCurrentState(
        color: state.color, 
        isLoading: false, error: 
        failure.getLocalizedString())), 
      (entity) => emit(ColorCurrentState(
        color: Color(
          int.tryParse(entity.color) ?? 0xFFFFFFF), 
        isLoading: false)));
  }

}