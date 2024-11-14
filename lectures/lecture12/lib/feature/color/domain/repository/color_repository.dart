import 'package:dartz/dartz.dart';
import 'package:demo_clean_architecture/feature/color/domain/entity/color_entity.dart';
import 'package:demo_clean_architecture/feature/color/domain/entity/color_falure.dart';

abstract class ColorRepository {
  Future<Either<ColorFailure, ColorEntity>> write(ColorEntity color);

  Future<Either<ColorFailure, ColorEntity>> read();
}