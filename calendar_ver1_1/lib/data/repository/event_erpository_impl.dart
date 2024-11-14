import 'package:calendar_ver1/core/failure/failure.dart';
import 'package:calendar_ver1/data/data_source/local_event_data_source.dart';
import 'package:calendar_ver1/domain/entity/event/event.dart';
import 'package:calendar_ver1/domain/repository/event_repository.dart';
import 'package:dartz/dartz.dart';

class EventErpositoryImpl implements EventRepository{
  final LocalEventDataSource _localEventDataSource;

  EventErpositoryImpl(this._localEventDataSource);

  @override
  Future<Either<Failure, void>> add(Event event) {
    return _localEventDataSource.add(event);
  }

  @override
  Future<Either<Failure, List<Event>>> getEventsForDay(DateTime day) {
    return _localEventDataSource.getEventsForDay(day);
  }

  @override
  Future<Either<Failure, void>> remove(Event event) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> update(Event event) {
    // TODO: implement update
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<Event>>> getEvents() {
    return _localEventDataSource.getEvents();
  }

}