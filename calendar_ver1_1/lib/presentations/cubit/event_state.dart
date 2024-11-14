part of 'event_cubit.dart';

sealed class EventState extends Equatable{
  final List<Event>? events;
  final bool isLoading;
  final String? error;

  EventState({required this.events, this.isLoading = false, this.error = ''});



  @override
  // TODO: implement props
  List<Object?> get props => [events, isLoading, error];
}

class EventCurrentState extends EventState{
  EventCurrentState({required super.events, super.isLoading, super.error});

}