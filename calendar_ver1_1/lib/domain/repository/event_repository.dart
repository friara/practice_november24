import 'package:calendar_ver1/core/failure/failure.dart';
import 'package:calendar_ver1/domain/entity/event/event.dart';
import 'package:dartz/dartz.dart';

abstract class EventRepository {
  Future<Either<Failure,void>> add(Event event);
  Future<Either<Failure,void>> remove(Event event);
  Future<Either<Failure,List<Event>>> getEventsForDay(DateTime day);
  Future<Either<Failure,List<Event>>> getEvents();
  Future<Either<Failure,void>> update(Event event);
}