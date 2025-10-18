import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/apis/home_api_service.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/home/domain/repos/home_repo.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  // Dio
  getIt.registerLazySingleton<Dio>(() => DioFactory.create());

  // Home Feature
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(getIt()));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
