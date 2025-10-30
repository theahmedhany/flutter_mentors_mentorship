import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:week_6/features/home/data/cache/movies_cache_service.dart';
import 'package:week_6/features/home/data/repos/all_movies_repo.dart';
import 'package:week_6/features/home/presentation/logic/all_movies_cubit.dart';

import '../networking/api_services.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  // All Movies
  getIt.registerLazySingleton<MoviesCacheService>(() => MoviesCacheService());
  getIt.registerLazySingleton<AllMoviesRepo>(() => AllMoviesRepo(getIt()));
  getIt.registerFactory<AllMoviesCubit>(() => AllMoviesCubit(getIt(), getIt()));
}
