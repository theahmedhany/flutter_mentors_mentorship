import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_2/core/theme/app_color.dart';

class DetailsImageSection extends StatelessWidget {
  const DetailsImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          'assets/images/poster_1.png',
          width: double.infinity,
          height: 520.h,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 50.h,
          left: 20.w,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.3),
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.white.withValues(alpha: 0.3),
                  width: 1.r,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.3),
                    blurRadius: 8.r,
                    offset: Offset(0, 4.h),
                  ),
                ],
                gradient: LinearGradient(
                  colors: [
                    AppColors.accentBlue.withValues(alpha: 0.6),
                    AppColors.accentBlue.withValues(alpha: 0.3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Icon(Icons.arrow_back_ios_new, color: AppColors.white),
            ),
          ),
        ),
        Positioned(
          bottom: -60.h,
          left: 0,
          right: 0,
          child: Center(
            child: Image.asset(
              'assets/images/badge_image.png',
              width: 200.w,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
