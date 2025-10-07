import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3/core/common/widgets/custom_app_button.dart';
import 'package:week_3/core/common/widgets/custom_text_form_field.dart';
import 'package:week_3/core/helpers/extensions.dart';
import 'package:week_3/core/helpers/spacing.dart';
import 'package:week_3/core/routing/routes.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';
import 'package:week_3/core/theme/app_texts/app_text_styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool rememberMe = true;
  bool isPasswordVisible = false;

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
                    "Sign Up",
                    style: AppTextStyles.font32Bold.copyWith(
                      color: LightAppColors.grey900,
                    ),
                  ),
                ),
                verticalSpace(40),

                CustomTextFormField(
                  label: "First Name",
                  hintText: "Enter your first name",
                  validator: (value) {
                    return null;
                  },
                ),

                verticalSpace(20),

                CustomTextFormField(
                  label: "Last Name",
                  hintText: "Enter your last name",
                  validator: (value) {
                    return null;
                  },
                ),

                verticalSpace(20),

                CustomTextFormField(
                  label: "Email",
                  hintText: "Enter your email",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    return null;
                  },
                ),

                verticalSpace(20),

                CustomTextFormField(
                  label: "Password",
                  hintText: "Enter your password",
                  isObscureText: !isPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: LightAppColors.grey700,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                  validator: (value) {
                    return null;
                  },
                ),

                verticalSpace(80),

                CustomAppButton(onPress: () {}, text: 'Sign Up'),

                verticalSpace(12),

                CupertinoButton(
                  onPressed: () {
                    context.pushReplacementNamed(Routes.loginScreen);
                  },
                  padding: EdgeInsets.zero,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style: AppTextStyles.font16Regular.copyWith(
                            color: LightAppColors.grey900,
                          ),
                          children: [
                            TextSpan(
                              text: "Login",
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
