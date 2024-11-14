import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:demo_clean_architecture/feature/color/domain/entity/color_entity.dart';
import 'package:demo_clean_architecture/feature/color/domain/entity/color_falure.dart';
import 'package:demo_clean_architecture/feature/color/domain/usecase/get_color_use_case.dart';
import 'package:demo_clean_architecture/feature/color/domain/usecase/select_color_use_case.dart';
import 'package:demo_clean_architecture/feature/color/presentation/cubit/color_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetColorUseCase extends Mock implements GetColorUseCase {}
class MockSelectColorUseCase extends Mock implements SelectColorUseCase {}
class ColorEntityFake extends Fake implements ColorEntity {}

void main() {
  setUpAll( () {
    registerFallbackValue(ColorEntityFake());
  }
    
  );

  group('Select color use case test:', () {
    
    blocTest('Проверка начального состояния кубита', build: () {
      final GetColorUseCase getColorUseCase = MockGetColorUseCase();
      final SelectColorUseCase selectColorUseCase = MockSelectColorUseCase();

      final ColorEntity colorEntity = ColorEntity(color: Colors.black.value.toString());
      when(() => getColorUseCase.call()).thenAnswer((_) async {
        return Right<ColorFailure,ColorEntity>(colorEntity);
      });

      return ColorCubit(getColorUseCase, selectColorUseCase);
    },
    expect: () => [ColorCurrentState(color: Colors.black)],
    );
    
    blocTest('Успешное сохранение цвета', build: () {
      final GetColorUseCase getColorUseCase = MockGetColorUseCase();
      final SelectColorUseCase selectColorUseCase = MockSelectColorUseCase();

      final ColorEntity colorEntity = ColorEntity(color: Colors.black.value.toString());
      final ColorEntity newColorEntity = ColorEntity(color: Colors.white.value.toString());
      
      when(() => getColorUseCase.call()).thenAnswer((_) async {
        return Right<ColorFailure,ColorEntity>(colorEntity);
      });
      when(() => selectColorUseCase.call(any())).thenAnswer((_) async {
        return Right<ColorFailure,ColorEntity>(newColorEntity);
      });
      return ColorCubit(getColorUseCase, selectColorUseCase);
    },
    act: (cubit) => cubit.setColor(Colors.black),
    expect: () => [
      ColorCurrentState(color: Colors.black),
      ColorCurrentState(color: Colors.white)],
    );

    

    
  });
}