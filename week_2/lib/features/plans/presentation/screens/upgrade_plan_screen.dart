import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:week_2/core/theme/app_color.dart';
import 'package:week_2/features/plans/presentation/widgets/custom_plan_button.dart';
import 'package:week_2/features/plans/presentation/widgets/upgrade_plan_container.dart';

class UpgradePlanScreen extends StatelessWidget {
  const UpgradePlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.accentBlue.withValues(alpha: 0.9),
              AppColors.accentBlue.withValues(alpha: 0.4),
              AppColors.accentBlue.withValues(alpha: 0.1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: SvgPicture.asset(
                'assets/icons/left_star.svg',
                fit: BoxFit.cover,
                width: 300.w,
                height: 300.h,
              ),
            ),
            Positioned(
              top: 150.h,
              right: 0,
              child: SvgPicture.asset(
                'assets/icons/right_star_1.svg',
                fit: BoxFit.cover,
                width: 300.w,
                height: 300.h,
              ),
            ),

            SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: Column(
                  children: [
                    SizedBox(
                      height: 56.h,
                      child: Row(
                        children: [
                          SizedBox(width: 36.w),
                          Expanded(
                            child: Text(
                              'Upgrade Plan',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.dark1,
                                fontSize: 20.sp,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 36.w,
                              height: 36.h,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.close,
                                color: AppColors.dark1,
                                size: 20.r,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/rocket_boy.png',
                              width: 207.w,
                              height: 207.h,
                            ),

                            SizedBox(height: 20.h),

                            Text(
                              'Seamless Anime\nExperience, Ad-Free.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.dark1,
                                fontSize: 24.sp,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            SizedBox(height: 4.h),

                            Text(
                              'Enjoy unlimited anime streaming without interruptions.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.gray500,
                                fontSize: 14.sp,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w300,
                              ),
                            ),

                            SizedBox(height: 36.h),

                            UpgradePlanContainer(
                              isSelected: true,
                              imagePath: 'assets/images/file_folders.png',
                              planText: 'Month',
                              priceText: '9.99',
                              descriptionText: 'Include Family Sharing',
                            ),

                            SizedBox(height: 16.h),

                            UpgradePlanContainer(
                              isSelected: false,
                              imagePath: 'assets/images/file_folders.png',
                              planText: 'Year',
                              priceText: '99.99',
                              descriptionText: 'Include Family Sharing',
                            ),

                            SizedBox(height: 34.h),

                            CustomPlanButton(
                              buttonText: 'Continue',
                              press: () {},
                              backgroundColor: AppColors.primary,
                              textColor: AppColors.white,
                            ),

                            SizedBox(height: 40.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
