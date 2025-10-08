import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors/light_app_colors.dart';
import '../../theme/app_texts/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final bool? isEnabled;
  final int? maxLength;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String label;

  const CustomTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.prefixIcon,
    this.isEnabled,
    this.maxLength,
    this.keyboardType,
    this.maxLines,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
        ),
        SizedBox(height: 6.h),
        TextFormField(
          controller: controller,
          enabled: isEnabled,
          maxLength: maxLength,
          maxLines: maxLines ?? 1,
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: LightAppColors.primary500,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(vertical: 8.h),

            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: LightAppColors.grey400,
                width: 1.5.w,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: LightAppColors.primary600,
                width: 1.5.w,
              ),
            ),

            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: LightAppColors.error, width: 1.5.w),
            ),

            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: LightAppColors.error, width: 1.5.w),
            ),

            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: LightAppColors.grey400,
                width: 1.5.w,
              ),
            ),

            hintStyle:
                hintStyle ??
                AppTextStyles.font18Regular.copyWith(
                  color: LightAppColors.grey700,
                ),
            suffixIcon: suffixIcon,
            fillColor: backgroundColor ?? LightAppColors.background,
            filled: true,
            prefixIcon: prefixIcon,
          ),
          obscureText: isObscureText ?? false,
          style: AppTextStyles.font18Regular.copyWith(
            color: LightAppColors.grey900,
          ),
          validator: (value) {
            return validator(value);
          },
        ),
      ],
    );
  }
}
