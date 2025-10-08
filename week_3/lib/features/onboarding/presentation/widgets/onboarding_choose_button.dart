import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors/light_app_colors.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';

class OnboardingChooseButton extends StatelessWidget {
  const OnboardingChooseButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        child: Container(
          height: 48.h,
          margin: EdgeInsets.symmetric(horizontal: 6.w),
          decoration: BoxDecoration(
            color: isSelected
                ? LightAppColors.primary500
                : LightAppColors.grey200,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Text(
              text,
              style: AppTextStyles.font16Regular.copyWith(
                color: isSelected
                    ? LightAppColors.white
                    : LightAppColors.primary600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
