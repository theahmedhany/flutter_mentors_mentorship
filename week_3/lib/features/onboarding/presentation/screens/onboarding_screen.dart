import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors/light_app_colors.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../widgets/onboarding_choose_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightAppColors.primary500,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [LightAppColors.primary300, LightAppColors.primary500],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Image.asset(
                'assets/images/onboarding.png',
                height: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 20.w),
            decoration: BoxDecoration(
              color: LightAppColors.white,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Look Good, Feel Good",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.font24Bold.copyWith(
                    color: LightAppColors.grey900,
                  ),
                ),

                verticalSpace(8),

                Text(
                  "Create your individual & unique style and look amazing everyday.",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.font16Regular.copyWith(
                    color: LightAppColors.grey600,
                  ),
                ),

                verticalSpace(24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OnboardingChooseButton(
                      text: "Login",
                      isSelected: false,
                      onTap: () {
                        context.pushNamed(Routes.loginScreen);
                      },
                    ),
                    OnboardingChooseButton(
                      text: "Signup",
                      isSelected: true,
                      onTap: () {
                        context.pushNamed(Routes.signUpScreen);
                      },
                    ),
                  ],
                ),

                verticalSpace(16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
