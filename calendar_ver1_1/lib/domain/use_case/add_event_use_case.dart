import 'package:calendar_ver1/core/failure/failure.dart';
import 'package:calendar_ver1/domain/entity/event/event.dart';
import 'package:calendar_ver1/domain/repository/event_repository.dart';
import 'package:dartz/dartz.dart';

class AddEventUseCase {
  final EventRepository _repository;

  AddEventUseCase(this._repository);

  Future<Either<Failure,void>> call(Event event) async {
    return _repository.add(event);
  }
}