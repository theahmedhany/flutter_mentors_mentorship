import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3/core/helpers/extensions.dart';
import 'package:week_3/core/helpers/spacing.dart';
import 'package:week_3/core/routing/routes.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';
import 'package:week_3/core/theme/app_texts/app_text_styles.dart';
import 'package:week_3/features/login/presentation/widgets/custom_login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightAppColors.background,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: LightAppColors.grey200,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ),
                verticalSpace(16),
                Center(
                  child: Text(
                    "Welcome Back",
                    style: AppTextStyles.font32Bold.copyWith(
                      color: LightAppColors.grey900,
                    ),
                  ),
                ),
                verticalSpace(6),
                Center(
                  child: Text(
                    "Please enter your data to continue",
                    style: AppTextStyles.font16Regular.copyWith(
                      color: LightAppColors.grey600,
                    ),
                  ),
                ),
                verticalSpace(40),

                CustomLoginForm(),

                verticalSpace(12),

                CupertinoButton(
                  onPressed: () {
                    context.pushReplacementNamed(Routes.signUpScreen);
                  },
                  padding: EdgeInsets.zero,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: AppTextStyles.font16Regular.copyWith(
                            color: LightAppColors.grey900,
                          ),
                          children: [
                            TextSpan(
                              text: "Signup",
                              style: AppTextStyles.font16SemiBold.copyWith(
                                color: LightAppColors.primary500,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                verticalSpace(12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
