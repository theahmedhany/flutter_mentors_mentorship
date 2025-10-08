import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3/core/di/dependency_injection.dart';
import 'package:week_3/core/utils/constants.dart';
import 'package:week_3/features/favorite/presentation/logic/favorite_cubit.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

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
          create: (context) => getIt<FavoriteCubit>()..loadFavorites(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.generateRoute,
            initialRoute: isLoggedInUser
                ? Routes.mainHomeScreen
                : Routes.onboardingScreen,
          ),
        );
      },
    );
  }
}
