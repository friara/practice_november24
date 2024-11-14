import 'package:dartz/dartz.dart';
import 'package:demo_clean_architecture/feature/color/domain/entity/color_entity.dart';
import 'package:demo_clean_architecture/feature/color/domain/entity/color_falure.dart';
import 'package:demo_clean_architecture/feature/color/domain/repository/color_repository.dart';
import 'package:demo_clean_architecture/feature/color/domain/usecase/get_color_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockColorRepository extends Mock implements ColorRepository {}

void main() {
  setUpAll(() => print('setupAll'));

  group('Get color use case test:', () {
    

    ColorRepository colorRepository = MockColorRepository();

    setUp(() => print('setUp'));

    test('При успешном получении цвета должен возвращать цвет', () async {
      final ColorEntity colorEntity = ColorEntity(color: Colors.black.value.toString());
      when(() => colorRepository.read()).thenAnswer((_) async {
        return Right<ColorFailure,ColorEntity>(colorEntity);
      });

      GetColorUseCase getColorUseCase = GetColorUseCase(colorRepository: colorRepository);

      final result = await getColorUseCase.call();
      verify(() => colorRepository.read()).called(1);

      expect(result, equals(Right<ColorFailure,ColorEntity>(colorEntity)));
    });

    test('При ошибке получения цвета возвращается Failure', () async {
      final ColorEntity colorEntity = ColorEntity(color: Colors.black.value.toString());
      final ColorFailure colorFailure = ColorFailure(code: 1);
      when(() => colorRepository.read()).thenAnswer((_) async {
        return Left<ColorFailure,ColorEntity>(colorFailure);
      });

      GetColorUseCase getColorUseCase = GetColorUseCase(colorRepository: colorRepository);

      final result = await getColorUseCase.call();
      verify(() => colorRepository.read()).called(1);

      expect(result, equals(Left<ColorFailure,ColorEntity>(colorFailure)));
    });
  });
}