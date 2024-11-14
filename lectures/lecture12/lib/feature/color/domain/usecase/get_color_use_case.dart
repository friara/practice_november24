import 'package:dartz/dartz.dart';
import 'package:demo_clean_architecture/core/use_case/use_case.dart';
import 'package:demo_clean_architecture/feature/color/domain/entity/color_entity.dart';
import 'package:demo_clean_architecture/feature/color/domain/entity/color_falure.dart';
import 'package:demo_clean_architecture/feature/color/domain/repository/color_repository.dart';

class GetColorUseCase implements UseCaseNoParams<ColorEntity>{
final ColorRepository colorRepository;

  GetColorUseCase({required this.colorRepository});

  @override
  Future<Either<ColorFailure, ColorEntity>> call() {
    return colorRepository.read();
  }
}