import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:week_3/core/helpers/spacing.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';
import 'package:week_3/core/theme/app_texts/app_text_styles.dart';
import 'package:week_3/features/verify_email/presentation/widgets/custom_otp_verify_form.dart';

class OtpScreen extends StatelessWidget {
  final String email;
  const OtpScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightAppColors.background,
      appBar: AppBar(
        backgroundColor: LightAppColors.background,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        iconTheme: const IconThemeData(color: LightAppColors.primary600),
        centerTitle: true,
        title: Text(
          'Enter OTP',
          style: AppTextStyles.font24SemiBold.copyWith(
            color: LightAppColors.primary600,
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(32),

                SvgPicture.asset('assets/icons/otp_icon.svg'),

                verticalSpace(24),

                Text(
                  "Enter the verification code",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.font24Bold.copyWith(
                    color: LightAppColors.grey900,
                  ),
                ),

                verticalSpace(16),

                Text(
                  "We have sent a 6-digit code to your email address.",
                  style: AppTextStyles.font16Regular.copyWith(
                    color: LightAppColors.grey600,
                  ),
                  textAlign: TextAlign.center,
                ),

                verticalSpace(60),

                CustomOtpVerifyForm(email: email),

                verticalSpace(24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
