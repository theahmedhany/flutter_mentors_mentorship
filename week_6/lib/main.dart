import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_6/core/cache/hive_cache_adapters.dart';
import 'package:week_6/core/di/dependency_injection.dart';
import 'package:week_6/core/helpers/shared_pref_helper.dart';
import 'package:week_6/core/routing/app_router.dart';
import 'package:week_6/core/routing/routes.dart';
import 'package:week_6/core/theme/theme_data/dark_them_data.dart';
import 'package:week_6/core/theme/theme_data/light_theme_data.dart';
import 'package:week_6/core/theme/theme_manager/theme_cubit.dart';
import 'package:week_6/features/details/data/cache/movie_details_cache_service.dart';
import 'package:week_6/features/home/data/cache/movies_cache_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  await SharedPrefHelper.init();

  await initGetIt();

  await HiveCacheAdapters.init();
  await MoviesCacheService.init();
  await MovieDetailsCacheService.init();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) {
        return MyApp(appRouter: AppRouter());
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (_) => ThemeCubit(),
          child: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, newMode) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,

                // Set the app theme
                theme: getLightTheme(context),
                darkTheme: getDarkTheme(context),
                themeMode: newMode,

                onGenerateRoute: appRouter.generateRoute,
                initialRoute: Routes.homeScreen,
              );
            },
          ),
        );
      },
    );
  }
}
