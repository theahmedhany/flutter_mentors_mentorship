import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_6/core/common/widgets/theme_bottom_sheet.dart';
import 'package:week_6/features/home/presentation/widgets/all_movies_list.dart';

import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = [
      MovieItem(
        imageUrl:
            'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=400',
        name: 'Charity Name',
        location: 'Cairo, Egypt',
        rating: '56',
      ),
      MovieItem(
        imageUrl:
            'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=400',
        name: 'Charity Name',
        location: 'Cairo, Egypt',
        rating: '56',
      ),
      MovieItem(
        imageUrl:
            'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=400',
        name: 'Charity Name',
        location: 'Cairo, Egypt',
        rating: '56',
      ),
      MovieItem(
        imageUrl:
            'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=400',
        name: 'Charity Name',
        location: 'Cairo, Egypt',
        rating: '56',
      ),
      MovieItem(
        imageUrl:
            'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=400',
        name: 'Charity Name',
        location: 'Cairo, Egypt',
        rating: '56',
      ),
      MovieItem(
        imageUrl:
            'https://images.unsplash.com/photo-1582407947304-fd86f028f716?w=400',
        name: 'Charity Name',
        location: 'Cairo, Egypt',
        rating: '56',
      ),
      MovieItem(
        imageUrl:
            'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=400',
        name: 'Charity Name',
        location: 'Cairo, Egypt',
        rating: '56',
      ),
      MovieItem(
        imageUrl:
            'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=400',
        name: 'Charity Name',
        location: 'Cairo, Egypt',
        rating: '56',
      ),
      MovieItem(
        imageUrl:
            'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=400',
        name: 'Charity Name',
        location: 'Cairo, Egypt',
        rating: '56',
      ),
      MovieItem(
        imageUrl:
            'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=400',
        name: 'Charity Name',
        location: 'Cairo, Egypt',
        rating: '56',
      ),
      MovieItem(
        imageUrl:
            'https://images.unsplash.com/photo-1582407947304-fd86f028f716?w=400',
        name: 'Charity Name',
        location: 'Cairo, Egypt',
        rating: '56',
      ),
    ];

    return Scaffold(
      backgroundColor: context.customAppColors.background,
      appBar: AppBar(
        backgroundColor: context.customAppColors.background,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text(
          '🎬 Movies',
          style: AppTextStyles.font18Bold.copyWith(
            color: context.customAppColors.grey900,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => const ThemeBottomSheet(),
              );
            },
            icon: Icon(
              Icons.spa_rounded,
              size: 24.w,
              color: context.customAppColors.primary800,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: AllMoviesList(movies: movies),
      ),
    );
  }
}

// TODO: Remove this with actual Movie model.
class MovieItem {
  final String imageUrl;
  final String name;
  final String location;
  final String rating;

  MovieItem({
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.rating,
  });
}
