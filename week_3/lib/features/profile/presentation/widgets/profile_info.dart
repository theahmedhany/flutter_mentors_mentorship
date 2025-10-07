import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3/core/helpers/spacing.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';
import 'package:week_3/core/theme/app_texts/app_text_styles.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: LightAppColors.white, width: 4),
            boxShadow: [
              BoxShadow(
                color: LightAppColors.primary700.withValues(alpha: 0.2),
                blurRadius: 20,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 60.r,
            backgroundColor: LightAppColors.primary500,
            child: Icon(Icons.person, size: 60.r, color: LightAppColors.white),
          ),
        ),

        verticalSpace(24),

        Text(
          'Alexander Morgan',
          style: AppTextStyles.font24Bold.copyWith(
            color: LightAppColors.grey900,
          ),
        ),

        verticalSpace(8),

        Text(
          'Senior Product Designer',
          style: AppTextStyles.font16SemiBold.copyWith(
            color: LightAppColors.grey600,
          ),
        ),
      ],
    );
  }
}
