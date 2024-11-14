import 'package:calendar_ver1/domain/entity/event/event.dart';
import 'package:calendar_ver1/domain/use_case/add_event_use_case.dart';
import 'package:calendar_ver1/domain/use_case/change_event_use_case.dart';
import 'package:calendar_ver1/domain/use_case/delete_event_use_case.dart';
import 'package:calendar_ver1/domain/use_case/get_events_for_day_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState>{
  
  final AddEventUseCase _addEventUseCase;
  final ChangeEventUseCase _changeEventUseCase;
  final DeleteEventUseCase _deleteEventUseCase;
  final GetEventsForDayUseCase _getEventsForDayUseCase;

  EventCubit(this._addEventUseCase, this._changeEventUseCase, this._deleteEventUseCase, this._getEventsForDayUseCase) 
  : super(EventCurrentState(events: null)) {
    //getEvents(DateTime.now());
  }

  Future<void> getEvents(DateTime dateTime) async {
    emit(EventCurrentState(events: state.events, isLoading: true));

    final result = await _getEventsForDayUseCase(dateTime);

    return result.fold(
      (failure) => emit(EventCurrentState(
        events: state.events, 
        isLoading: false, 
        error: 
          failure.getLocalizedString())), 
      (entity) => emit(EventCurrentState(
        events: entity, 
        isLoading: false)));
  }

  Future<void> addEvent(Event event) async {
    emit(EventCurrentState(events: state.events, isLoading: true));

    final result = await _addEventUseCase(event);

    return result.fold(
      (failure) => emit(EventCurrentState(
        events: state.events, 
        isLoading: false, 
        error: 
          failure.getLocalizedString())), 
      (empty) {
        emit(EventCurrentState(events: null, isLoading: false));
        getEvents(DateTime.now());//должно быть обновление списка событий
        });
  }

  Future<void> changeEvent(Event event) async {
    emit(EventCurrentState(events: state.events, isLoading: true));

    final result = await _changeEventUseCase(event);

    return result.fold(
      (failure) => emit(EventCurrentState(
        events: state.events, 
        isLoading: false, 
        error: 
          failure.getLocalizedString())), 
      (empty) {
        emit(EventCurrentState(events: null, isLoading: false));
        getEvents(DateTime.now());//должно быть обновление списка событий
        });
  }

  Future<void> deleteEvent(Event event) async {
    emit(EventCurrentState(events: state.events, isLoading: true));

    final result = await _deleteEventUseCase(event);

    return result.fold(
      (failure) => emit(EventCurrentState(
        events: state.events, 
        isLoading: false, 
        error: 
          failure.getLocalizedString())), 
      (empty) {
        emit(EventCurrentState(events: null, isLoading: false));
        getEvents(DateTime.now());//должно быть обновление списка событий
        });
  }


}