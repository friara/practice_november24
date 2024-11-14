import 'package:dartz/dartz.dart';
import 'package:demo_clean_architecture/feature/color/domain/entity/color_entity.dart';
import 'package:demo_clean_architecture/feature/color/domain/entity/color_falure.dart';
import 'package:demo_clean_architecture/feature/color/domain/repository/color_repository.dart';
import 'package:demo_clean_architecture/feature/color/domain/usecase/get_color_use_case.dart';
import 'package:demo_clean_architecture/feature/color/domain/usecase/select_color_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockColorRepository extends Mock implements ColorRepository {}

class ColorEntityFake extends Fake implements ColorEntity {}

void main() {
  setUpAll( () {
    registerFallbackValue(ColorEntityFake());
  }
    
  );

  group('Select color use case test:', () {
    

    ColorRepository colorRepository = MockColorRepository();

    setUp(() => print('setUp'));

    test('При успешном сохранении цвета должен его возвращать', () async {
      final ColorEntity colorEntity = ColorEntity(color: Colors.black.value.toString());
      when(() => colorRepository.write(any())).thenAnswer((_) async {
        return Right<ColorFailure,ColorEntity>(colorEntity);
      });

      SelectColorUseCase selectColorUseCase = SelectColorUseCase(colorRepository: colorRepository);

      final result = await selectColorUseCase.call(colorEntity);
      

      expect(result, equals(Right<ColorFailure,ColorEntity>(colorEntity)));
    });

    
  });
}