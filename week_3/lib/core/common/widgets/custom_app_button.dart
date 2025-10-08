import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors/light_app_colors.dart';
import '../../theme/app_texts/app_text_styles.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton({super.key, required this.onPress, required this.text});

  final VoidCallback onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: LightAppColors.primary500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        onPressed: onPress,
        child: Text(
          text,
          style: AppTextStyles.font18SemiBold.copyWith(
            color: LightAppColors.grey0,
          ),
        ),
      ),
    );
  }
}
