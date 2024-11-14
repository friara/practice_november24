import 'package:calendar_ver1/core/failure/failure.dart';
import 'package:calendar_ver1/domain/entity/event/event.dart';
import 'package:calendar_ver1/domain/repository/event_repository.dart';
import 'package:dartz/dartz.dart';

class GetEventsUseCase {
  final EventRepository _repository;

  GetEventsUseCase(this._repository);


  Future<Either<Failure,List<Event>>> call() async {
    return _repository.getEvents();}
}