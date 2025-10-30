import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week_6/core/di/dependency_injection.dart';
import 'package:week_6/features/home/presentation/logic/all_movies_cubit.dart';

import '../../features/home/presentation/screens/home_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Home Screen
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AllMoviesCubit>()..emitGetAllMovies(),
            child: const HomeScreen(),
          ),
        );

      // Movie Details Screen
      // case Routes.movieDetailsScreen:
      //   final movie = settings.arguments as MovieItem;
      //   return MaterialPageRoute(
      //     builder: (_) => MovieDetailsScreen(movie: movie),
      //   );

      default:
        return null;
    }
  }
}
