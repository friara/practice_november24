import 'package:calendar_ver1/core/failure/failure.dart';
import 'package:calendar_ver1/domain/entity/event/event.dart';
import 'package:dartz/dartz.dart';

abstract class LocalEventDataSource {
  Future<Either<Failure, void>> add(Event event);

  Future<Either<Failure, List<Event>>> getEventsForDay(DateTime date);

  Future<Either<Failure, void>> delete(Event event);

  Future<Either<Failure, void>> update(Event event);

  Future<Either<Failure, List<Event>>> getEvents();
}