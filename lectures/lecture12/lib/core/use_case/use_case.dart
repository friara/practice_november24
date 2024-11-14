import 'package:dartz/dartz.dart';
import 'package:demo_clean_architecture/core/failure/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params Params);
}

abstract class UseCaseNoParams<Type> {
  Future<Either<Failure, Type>> call();
}