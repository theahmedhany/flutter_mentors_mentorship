import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/breed_model.dart';

class PetCard extends StatelessWidget {
  final BreedModel breed;

  const PetCard({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              bottomLeft: Radius.circular(16.r),
            ),
            child: CachedNetworkImage(
              imageUrl: breed.referenceImageId?.toImageUrl() ?? '',
              width: 130.w,
              height: 140.h,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: 130.w,
                height: 140.h,
                color: AppColors.lightGray,
                child: const Center(
                  child: CircularProgressIndicator(color: AppColors.mainTeal),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: 130.w,
                height: 140.h,
                color: AppColors.lightGray,
                child: Icon(Icons.pets, size: 50.sp, color: AppColors.gray),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              breed.name,
                              style: TextStyles.font18BlackSemiBold,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              _getGenderAndAge(),
                              style: TextStyles.font14GrayRegular,
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              breed.lifeSpan ?? 'Unknown age',
                              style: TextStyles.font14GrayRegular,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: AppColors.mainTeal,
                          size: 24.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16.sp,
                        color: AppColors.red,
                      ),
                      SizedBox(width: 4.w),
                      Text(_getDistance(), style: TextStyles.font12GrayRegular),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getGenderAndAge() {
    final temperaments = breed.temperament?.split(',') ?? [];
    if (temperaments.isNotEmpty) {
      return temperaments.first.trim();
    }
    return 'Unknown';
  }

  String _getDistance() {
    return breed.origin ?? 'Unknown location';
  }
}
