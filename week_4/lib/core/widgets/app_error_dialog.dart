import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';
import '../theming/app_colors.dart';
import '../theming/styles.dart';
import 'app_text_button.dart';

class AppErrorDialog extends StatelessWidget {
  final String errorMessage;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const AppErrorDialog({
    super.key,
    required this.errorMessage,
    this.buttonText,
    this.onButtonPressed,
  });

  static Future<void> show(
    BuildContext context,
    String errorMessage, {
    String? buttonText,
    VoidCallback? onButtonPressed,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AppErrorDialog(
        errorMessage: errorMessage,
        buttonText: buttonText,
        onButtonPressed: onButtonPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 64.sp, color: AppColors.red),
            verticalSpace(16),
            Text('Error', style: TextStyles.font18BlackSemiBold),
            verticalSpace(12),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: TextStyles.font14GrayRegular,
            ),
            verticalSpace(24),
            AppTextButton(
              buttonText: buttonText ?? 'Okay',
              onPressed:
                  onButtonPressed ??
                  () {
                    Navigator.of(context).pop();
                  },
              buttonHeight: 45.h,
            ),
          ],
        ),
      ),
    );
  }
}
