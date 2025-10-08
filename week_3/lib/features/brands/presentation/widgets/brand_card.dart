import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/common/widgets/custom_loading.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors/light_app_colors.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';

class BrandCard extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;

  const BrandCard({
    super.key,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: LightAppColors.primary200.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(width: 1, color: LightAppColors.primary400),
        boxShadow: [
          BoxShadow(
            color: LightAppColors.primary700.withValues(alpha: 0.06),
            blurRadius: 15,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                height: 80.h,
                width: 80.w,
                decoration: BoxDecoration(
                  color: LightAppColors.primary500.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: LightAppColors.primary400,
                    width: 1.5.w,
                  ),
                ),
                child: Center(
                  child: SvgPicture.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    placeholderBuilder: (context) =>
                        const Center(child: CustomLoading()),
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
              ),
            ),

            horizontalSpace(16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.font18Bold.copyWith(
                      color: LightAppColors.grey900,
                    ),
                  ),

                  verticalSpace(8),

                  Text(
                    description,
                    style: AppTextStyles.font14Regular.copyWith(
                      color: LightAppColors.grey600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
