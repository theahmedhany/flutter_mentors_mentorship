import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:week_3/core/helpers/spacing.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';

class ProductsShimmerLoading extends StatelessWidget {
  final int itemCount;

  const ProductsShimmerLoading({super.key, this.itemCount = 8});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        mainAxisExtent: 290.h,
      ),
      itemBuilder: (context, index) {
        return const ProductCardShimmer();
      },
    );
  }
}

class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: LightAppColors.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: LightAppColors.grey300,
            highlightColor: LightAppColors.grey100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Container(
                height: 200.h,
                width: double.infinity,
                color: LightAppColors.background,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: LightAppColors.grey300,
                  highlightColor: LightAppColors.grey100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 14.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: LightAppColors.background,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Container(
                        height: 14.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          color: LightAppColors.background,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ],
                  ),
                ),

                verticalSpace(6),

                Shimmer.fromColors(
                  baseColor: LightAppColors.grey300,
                  highlightColor: LightAppColors.grey100,
                  child: Container(
                    height: 18.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      color: LightAppColors.background,
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
