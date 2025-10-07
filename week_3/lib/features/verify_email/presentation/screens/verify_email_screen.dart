import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:week_3/core/common/widgets/custom_app_button.dart';
import 'package:week_3/core/common/widgets/custom_text_form_field.dart';
import 'package:week_3/core/helpers/extensions.dart';
import 'package:week_3/core/helpers/spacing.dart';
import 'package:week_3/core/routing/routes.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';
import 'package:week_3/core/theme/app_texts/app_text_styles.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

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
          'Verify Email',
          style: AppTextStyles.font24SemiBold.copyWith(
            color: LightAppColors.primary600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(80),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/confirm.svg',
                  height: 200.h,
                  width: 200.w,
                ),
              ],
            ),

            verticalSpace(24),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                'Please enter your email address to verify your account. We have sent a verification code to your email.',
                textAlign: TextAlign.center,
                style: AppTextStyles.font16Regular.copyWith(
                  color: LightAppColors.grey600,
                ),
              ),
            ),

            verticalSpace(24),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CustomTextFormField(
                hintText: 'Email',
                label: '',
                validator: (value) {},
              ),
            ),

            verticalSpace(60),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CustomAppButton(
                onPress: () {
                  context.pushNamed(Routes.otpScreen);
                },
                text: 'Verify Email',
              ),
            ),

            verticalSpace(24),
          ],
        ),
      ),
    );
  }
}
