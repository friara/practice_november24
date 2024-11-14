import 'package:dartz/dartz.dart';
import 'package:demo_clean_architecture/feature/color/domain/entity/color_falure.dart';

abstract class LocalColorDataSource {
  Future<Either<ColorFailure, String>> write(String color);

  Future<Either<ColorFailure, String>> read();
}