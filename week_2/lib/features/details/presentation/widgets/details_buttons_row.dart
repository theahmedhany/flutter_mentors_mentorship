import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_2/core/theme/app_color.dart';
import 'package:week_2/features/details/presentation/widgets/details_custom_button.dart';
import 'package:week_2/features/plans/presentation/screens/upgrade_plan_screen.dart';

class DetailsButtonsRow extends StatelessWidget {
  const DetailsButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dark1,
      height: 80.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            child: DetailsCustomButton(
              iconPath: 'assets/icons/stopwatch_play.svg',
              buttonText: 'Preview',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return UpgradePlanScreen();
                    },
                  ),
                );
              },
              backgroundColor: AppColors.gray500.withValues(alpha: 0.4),
              textColor: AppColors.white,
            ),
          ),

          SizedBox(width: 16.w),

          Expanded(
            child: DetailsCustomButton(
              iconPath: 'assets/icons/solid_eye.svg',
              buttonText: 'Watch Now',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return UpgradePlanScreen();
                    },
                  ),
                );
              },
              backgroundColor: AppColors.primary,
              textColor: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
