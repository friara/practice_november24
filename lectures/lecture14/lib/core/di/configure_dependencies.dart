import 'package:demo_clean_architecture/feature/color/data/data_source/file_local_color_data_source.dart';
import 'package:demo_clean_architecture/feature/color/data/data_source/local_color_data_source.dart';
import 'package:demo_clean_architecture/feature/color/data/repository/color_repository_impl.dart';
import 'package:demo_clean_architecture/feature/color/domain/repository/color_repository.dart';
import 'package:demo_clean_architecture/feature/color/domain/usecase/get_color_use_case.dart';
import 'package:demo_clean_architecture/feature/color/domain/usecase/select_color_use_case.dart';
import 'package:demo_clean_architecture/feature/color/presentation/cubit/color_cubit.dart';
import 'package:get_it/get_it.dart';

void configureDependencies() {
  GetIt.I.registerFactory<LocalColorDataSource>(() => FileLocalColorDataSource());

  GetIt.I.registerFactory<ColorRepository>(
    () => ColorRepositoryImpl(localColorDataSource: GetIt.I()));
  
  GetIt.I.registerFactory(() => GetColorUseCase(colorRepository: GetIt.I()));
  GetIt.I.registerFactory(() => SelectColorUseCase(colorRepository: GetIt.I()));

  GetIt.I.registerLazySingleton<ColorCubit>(
    () => ColorCubit(GetIt.I(), GetIt.I()));
}