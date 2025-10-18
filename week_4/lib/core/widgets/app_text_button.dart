import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/styles.dart';

class AppTextButton extends StatelessWidget {
  final String buttonText;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? borderRadius;
  final Color? backgroundColor;
  final bool isLoading;

  const AppTextButton({
    super.key,
    required this.buttonText,
    this.textStyle,
    this.onPressed,
    this.buttonHeight,
    this.buttonWidth,
    this.borderRadius,
    this.backgroundColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight ?? 50.h,
      width: buttonWidth ?? double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.mainTeal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          ),
          disabledBackgroundColor:
              backgroundColor?.withValues(alpha: 0.6) ?? AppColors.gray,
        ),
        child: isLoading
            ? SizedBox(
                height: 24.h,
                width: 24.w,
                child: const CircularProgressIndicator(
                  color: AppColors.white,
                  strokeWidth: 2.5,
                ),
              )
            : Text(
                buttonText,
                style: textStyle ?? TextStyles.font16WhiteSemiBold,
              ),
      ),
    );
  }
}
