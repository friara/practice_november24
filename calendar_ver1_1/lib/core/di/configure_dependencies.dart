import 'package:calendar_ver1/data/data_source/local_event_data_source.dart';
import 'package:calendar_ver1/data/data_source/sqlDB_local_event_data_source.dart';
import 'package:calendar_ver1/data/repository/event_erpository_impl.dart';
import 'package:calendar_ver1/domain/repository/event_repository.dart';
import 'package:calendar_ver1/domain/use_case/add_event_use_case.dart';
import 'package:calendar_ver1/domain/use_case/change_event_use_case.dart';
import 'package:calendar_ver1/domain/use_case/delete_event_use_case.dart';
import 'package:calendar_ver1/domain/use_case/get_events_for_day_use_case.dart';
import 'package:calendar_ver1/presentations/cubit/event_cubit.dart';
import 'package:get_it/get_it.dart';

void configureDependencies() {
  GetIt.I.registerFactory<LocalEventDataSource>(() => SqldbLocalEventDataSource());

  GetIt.I.registerFactory<EventRepository>(
    () => EventErpositoryImpl(GetIt.I()));
  
  GetIt.I.registerFactory(() => AddEventUseCase(GetIt.I()));
  GetIt.I.registerFactory(() => ChangeEventUseCase(GetIt.I()));
  GetIt.I.registerFactory(() => DeleteEventUseCase(GetIt.I()));
  GetIt.I.registerFactory(() => GetEventsForDayUseCase(GetIt.I()));

  GetIt.I.registerLazySingleton<EventCubit>(
    () => EventCubit(GetIt.I(), GetIt.I(), GetIt.I(), GetIt.I()));
}