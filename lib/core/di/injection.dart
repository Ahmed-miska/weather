import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weahter/core/networking/api_service.dart';
import 'package:weahter/core/networking/dio_factory.dart';
import 'package:weahter/core/networking/failures.dart';
import 'package:weahter/features/home/data/repo/home_repo.dart';
import 'package:weahter/features/home/logic/weather_cubit.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  Dio dio = DioFactory.getDio();

  /// Services
  getIt.registerLazySingleton(() => dio);
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt()));
  getIt.registerLazySingleton(() => Failure);

  /// Repos
  getIt.registerLazySingleton(() => WeatherRepo(getIt()));

  /// Cubits
  getIt.registerFactory(() => WeatherCubit(getIt()));
}
