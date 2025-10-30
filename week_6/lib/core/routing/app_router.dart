import 'package:flutter/material.dart';
import 'package:week_6/features/details/presentation/screens/movie_details_screen.dart';

import '../../features/home/presentation/screens/home_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Home Screen
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      // Movie Details Screen
      case Routes.movieDetailsScreen:
        final movie = settings.arguments as MovieItem;
        return MaterialPageRoute(
          builder: (_) => MovieDetailsScreen(movie: movie),
        );

      default:
        return null;
    }
  }
}
