import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/styles.dart';

class AppTextFormField extends StatefulWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final bool isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;

  const AppTextFormField({
    super.key,
    this.hintText,
    this.validator,
    this.isObscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    this.controller,
    this.keyboardType,
    this.maxLines = 1,
    this.contentPadding,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.hintStyle,
    this.inputTextStyle,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isObscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: _isObscure,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      style: widget.inputTextStyle ?? TextStyles.font14BlackRegular,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ?? TextStyles.font14GrayRegular,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isObscureText
            ? IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.gray,
                  size: 20.sp,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )
            : widget.suffixIcon,
        filled: true,
        fillColor: widget.backgroundColor ?? AppColors.lightGray,
        enabledBorder:
            widget.enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
        focusedBorder:
            widget.focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(
                color: AppColors.mainTeal,
                width: 1.5,
              ),
            ),
        errorBorder:
            widget.errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: AppColors.red, width: 1.5),
            ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.red, width: 1.5),
        ),
      ),
    );
  }
}
