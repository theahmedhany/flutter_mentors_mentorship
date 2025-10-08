import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week_3/core/helpers/spacing.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';
import 'package:week_3/core/theme/app_texts/app_text_styles.dart';

class HomeBrandListItem extends StatelessWidget {
  const HomeBrandListItem({
    super.key,
    required this.imagePath,
    required this.brandName,
  });

  final String imagePath, brandName;

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
          Expanded(
            child: Container(
              height: double.infinity,
              width: 40.w,
              padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 8.r),
              decoration: BoxDecoration(
                color: LightAppColors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Center(
                child: SvgPicture.network(
                  imagePath,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    LightAppColors.primary500,
                    BlendMode.srcIn,
                  ),
                  height: 20.h,
                  width: 20.w,
                ),
              ),
            ),
          ),

          horizontalSpace(4),
          Expanded(
            flex: 1,
            child: Text(
              brandName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.font14SemiBold.copyWith(
                color: LightAppColors.grey900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
