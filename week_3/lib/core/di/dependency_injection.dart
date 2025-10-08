import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:week_3/features/login/data/repos/login_repo.dart';
import 'package:week_3/features/login/presentation/logic/login_cubit.dart';
import 'package:week_3/features/signup/data/repos/signup_repo.dart';
import 'package:week_3/features/signup/presentation/logic/signup_cubit.dart';
import 'package:week_3/features/verify_email/data/repos/resend_otp_repo.dart';
import 'package:week_3/features/verify_email/data/repos/verify_otp_repo.dart';
import 'package:week_3/features/verify_email/presentation/logic/resend_otp/resend_otp_cubit.dart';
import 'package:week_3/features/verify_email/presentation/logic/verify_otp/verify_otp_cubit.dart';

import '../networking/api_services.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // Signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // Resend Otp
  getIt.registerLazySingleton<ResendOtpRepo>(() => ResendOtpRepo(getIt()));
  getIt.registerFactory<ResendOtpCubit>(() => ResendOtpCubit(getIt()));

  // Verify Otp
  getIt.registerLazySingleton<VerifyOtpRepo>(() => VerifyOtpRepo(getIt()));
  getIt.registerFactory<VerifyOtpCubit>(() => VerifyOtpCubit(getIt()));
}
