import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors/light_app_colors.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            enabled: false,
            decoration: InputDecoration(
              hintText: "Search...",
              hintStyle: AppTextStyles.font16Regular.copyWith(
                color: LightAppColors.grey600,
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: LightAppColors.grey600,
              ),
              filled: true,
              fillColor: LightAppColors.grey200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        horizontalSpace(12),

        Container(
          width: 54.w,
          height: 54.h,
          decoration: BoxDecoration(
            color: LightAppColors.primary500,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: const Icon(Icons.mic, color: LightAppColors.white),
        ),
      ],
    );
  }
}
