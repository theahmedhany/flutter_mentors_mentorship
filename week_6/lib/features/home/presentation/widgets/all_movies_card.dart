import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_6/core/common/widgets/custom_loading.dart';
import 'package:week_6/features/home/data/models/all_movies_model.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theme/theme_manager/theme_extensions.dart';

class AllMoviesCard extends StatelessWidget {
  const AllMoviesCard({super.key, required this.movie, required this.onTap});

  final MovieModel movie;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        decoration: BoxDecoration(
          color: context.customAppColors.grey50,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: context.customAppColors.grey100,
            width: 1.w,
          ),
          boxShadow: [
            BoxShadow(
              color: context.customAppColors.grey200,
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(8.r),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) {
                      return Container(
                        decoration: BoxDecoration(
                          color: context.customAppColors.primary300.withValues(
                            alpha: 0.4,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: context.customAppColors.grey100,
                            width: 1.w,
                          ),
                        ),
                        child: const Center(child: CustomLoading(size: 100)),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Container(
                        decoration: BoxDecoration(
                          color: context.customAppColors.primary300.withValues(
                            alpha: 0.4,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: context.customAppColors.grey100,
                            width: 1.w,
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/map.png',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title ?? 'No Title',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.font14SemiBold.copyWith(
                      color: context.customAppColors.grey900,
                    ),
                  ),
                  verticalSpace(6),
                  Row(
                    children: [
                      Icon(
                        Icons.merge_type_outlined,
                        size: 16.w,
                        color: context.customAppColors.primary800,
                      ),
                      horizontalSpace(4),
                      Expanded(
                        child: Text(
                          movie.originalLanguage?.toUpperCase() ?? 'N/A',
                          style: AppTextStyles.font12Regular.copyWith(
                            color: context.customAppColors.grey600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(4),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 16.w,
                        color: context.customAppColors.primary800,
                      ),
                      horizontalSpace(4),
                      Expanded(
                        child: Text(
                          movie.voteAverage != null
                              ? '${movie.voteAverage!.toStringAsFixed(1)} / 10'
                              : 'N/A',
                          style: AppTextStyles.font12Regular.copyWith(
                            color: context.customAppColors.grey600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
