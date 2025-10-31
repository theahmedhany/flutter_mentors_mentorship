import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
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

Future<void> main() async {
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

  if (!kDebugMode) {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://b70be1b821613139d05c59d78a256f11@o4510283114086400.ingest.us.sentry.io/4510283118673920';
        options.sendDefaultPii = true;
      },
      appRunner: () => runApp(
        DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) => MyApp(appRouter: AppRouter()),
        ),
      ),
    );
  } else {
    runApp(
      DevicePreview(
        enabled: false,
        builder: (context) => MyApp(appRouter: AppRouter()),
      ),
    );
  }
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
