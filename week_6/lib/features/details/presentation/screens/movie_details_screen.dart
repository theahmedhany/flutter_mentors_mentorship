// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:week_6/core/helpers/extensions.dart';
// import 'package:week_6/core/helpers/spacing.dart';
// import 'package:week_6/core/theme/theme_manager/theme_extensions.dart';
// import 'package:week_6/features/details/presentation/widgets/movie_description_section.dart';
// import 'package:week_6/features/details/presentation/widgets/movie_genre_badge.dart';
// import 'package:week_6/features/details/presentation/widgets/movie_info_grid.dart';
// import 'package:week_6/features/details/presentation/widgets/movie_poster_header.dart';
// import 'package:week_6/features/details/presentation/widgets/movie_rating_badge.dart';
// import 'package:week_6/features/details/presentation/widgets/movie_title_section.dart';
// import 'package:week_6/features/details/presentation/widgets/watch_now_button.dart';
// import 'package:week_6/features/home/presentation/screens/home_screen.dart';

// class MovieDetailsScreen extends StatelessWidget {
//   const MovieDetailsScreen({super.key, required this.movie});

//   final MovieItem movie;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: context.customAppColors.background,
//       body: CustomScrollView(
//         slivers: [
//           MoviePosterHeader(
//             imageUrl: movie.imageUrl,
//             onBackPressed: () => context.pop(),
//             onFavoritePressed: () {
//               // TODO: Implement favorite functionality.
//             },
//           ),

//           SliverToBoxAdapter(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.w),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   verticalSpace(16),

//                   MovieTitleSection(title: movie.name),

//                   verticalSpace(12),

//                   Row(
//                     children: [
//                       MovieRatingBadge(rating: movie.rating),
//                       horizontalSpace(12),
//                       MovieGenreBadge(genre: movie.location),
//                     ],
//                   ),

//                   verticalSpace(24),

//                   const MovieDescriptionSection(
//                     description:
//                         'Experience an epic adventure that will take you through stunning visuals and an engaging storyline. This masterpiece combines brilliant cinematography with outstanding performances from a talented cast. '
//                         '\n\nDelve into a world where every scene is crafted with precision, and every moment keeps you on the edge of your seat. The movie explores themes of courage, friendship, and the human spirit, making it a must-watch for cinema enthusiasts. '
//                         '\n\nWith breathtaking action sequences and emotional depth, this film has received critical acclaim and captured the hearts of audiences worldwide.',
//                   ),

//                   verticalSpace(24),

//                   const MovieInfoGrid(),

//                   verticalSpace(32),

//                   WatchNowButton(
//                     onPressed: () {
//                       // TODO: Implement watch functionality.
//                     },
//                   ),

//                   verticalSpace(32),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
