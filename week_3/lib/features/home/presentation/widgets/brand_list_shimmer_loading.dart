import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:week_3/core/helpers/spacing.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';

class BrandListShimmerLoading extends StatelessWidget {
  const BrandListShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        separatorBuilder: (_, __) => horizontalSpace(8),
        itemBuilder: (context, index) {
          return const HomeBrandListItemShimmer();
        },
      ),
    );
  }
}

class HomeBrandListItemShimmer extends StatelessWidget {
  const HomeBrandListItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: LightAppColors.grey200,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: LightAppColors.background,
            highlightColor: LightAppColors.grey200,
            child: SizedBox(
              child: Container(
                height: double.infinity,
                width: 40.w,
                decoration: BoxDecoration(
                  color: LightAppColors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ),
          horizontalSpace(8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: LightAppColors.background,
                  highlightColor: LightAppColors.grey200,
                  child: Container(
                    height: 14.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: LightAppColors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
                verticalSpace(4),
                Shimmer.fromColors(
                  baseColor: LightAppColors.background,
                  highlightColor: LightAppColors.grey200,
                  child: Container(
                    height: 10.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: LightAppColors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
