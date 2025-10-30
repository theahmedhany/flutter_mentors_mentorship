import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_6/core/helpers/extensions.dart';
import 'package:week_6/core/routing/routes.dart';
import 'package:week_6/features/home/presentation/screens/home_screen.dart';
import 'package:week_6/features/home/presentation/widgets/all_movies_card.dart';

class AllMoviesList extends StatelessWidget {
  const AllMoviesList({super.key, required this.movies});

  final List<MovieItem> movies;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 16.r, bottom: 24.r),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return AllMoviesCard(
          movie: movies[index],
          onTap: () {
            context.pushNamed(
              Routes.movieDetailsScreen,
              arguments: movies[index],
            );
          },
        );
      },
    );
  }
}
