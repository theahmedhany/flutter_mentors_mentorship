import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:week_3/core/common/widgets/custom_app_button.dart';
import 'package:week_3/core/helpers/spacing.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';
import 'package:week_3/core/theme/app_texts/app_text_styles.dart';
import 'package:week_3/features/verify_email/presentation/logic/verify_otp/verify_otp_cubit.dart';
import 'package:week_3/features/verify_email/presentation/widgets/verify_otp_bloc_listener.dart';

class CustomOtpVerifyForm extends StatefulWidget {
  final String email;
  const CustomOtpVerifyForm({super.key, required this.email});

  @override
  State<CustomOtpVerifyForm> createState() => _CustomOtpVerifyFormState();
}

class _CustomOtpVerifyFormState extends State<CustomOtpVerifyForm> {
  final FocusNode _focusNode = FocusNode();
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VerifyOtpCubit>().emailController.text = widget.email;
    });
  }

  PinTheme get _defaultPinTheme => PinTheme(
    width: 56.w,
    height: 56.h,
    textStyle: AppTextStyles.font18Bold.copyWith(color: LightAppColors.grey900),
    decoration: BoxDecoration(
      color: LightAppColors.grey100,
      border: Border.all(color: LightAppColors.grey300, width: 1.5.w),
      borderRadius: BorderRadius.circular(12.r),
    ),
  );

  PinTheme get _focusedPinTheme => _defaultPinTheme.copyWith(
    decoration: _defaultPinTheme.decoration!.copyWith(
      border: Border.all(color: LightAppColors.primary500, width: 1.5.w),
    ),
  );

  PinTheme get _submittedPinTheme => _defaultPinTheme.copyWith(
    decoration: _defaultPinTheme.decoration!.copyWith(
      border: Border.all(color: LightAppColors.primary500, width: 1.5.w),
    ),
  );

  PinTheme get _errorPinTheme => _defaultPinTheme.copyWith(
    decoration: _defaultPinTheme.decoration!.copyWith(
      border: Border.all(color: LightAppColors.error, width: 1.5.w),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<VerifyOtpCubit>().formKey,
      child: Column(
        children: [
          Center(
            child: Pinput(
              controller: context.read<VerifyOtpCubit>().otpController,
              focusNode: _focusNode,
              length: 6,
              showCursor: true,
              validator: (pin) {
                if (pin == null || pin.length < 6) {
                  return "Invalid code";
                }
                return null;
              },
              pinputAutovalidateMode: PinputAutovalidateMode.disabled,
              cursor: Container(
                width: 2.w,
                height: 24.h,
                color: LightAppColors.primary500,
              ),
              defaultPinTheme: _defaultPinTheme,
              focusedPinTheme: _focusedPinTheme,
              submittedPinTheme: _submittedPinTheme,
              errorPinTheme: _errorPinTheme,
              onChanged: (pin) {
                if (_errorMessage != null) {
                  setState(() {
                    _errorMessage = null;
                  });
                }
              },
              keyboardType: TextInputType.number,
              separatorBuilder: (index) => SizedBox(width: 12.w),
            ),
          ),

          if (_errorMessage != null) ...[
            SizedBox(height: 24.h),
            Text(
              _errorMessage!,
              style: AppTextStyles.font14SemiBold.copyWith(
                color: LightAppColors.error,
              ),
              textAlign: TextAlign.center,
            ),
          ],

          verticalSpace(40),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  context.read<VerifyOtpCubit>().otpController.clear();
                  setState(() => _errorMessage = null);
                  _focusNode.requestFocus();
                },
                child: Text(
                  "Clear Code",
                  style: AppTextStyles.font16Bold.copyWith(
                    color: LightAppColors.grey700,
                  ),
                ),
              ),
            ],
          ),

          verticalSpace(18),

          CustomAppButton(
            onPress: _validateAndProceed,
            text: 'Verify & Proceed',
          ),

          VerifyOtpBlocListener(),
        ],
      ),
    );
  }

  void _validateAndProceed() {
    final otp = context.read<VerifyOtpCubit>().otpController.text.trim();

    if (otp.length < 6) {
      setState(() {
        _errorMessage = "Please enter a valid 6-digit code.";
      });
    } else {
      setState(() {
        _errorMessage = null;
      });

      if (context.read<VerifyOtpCubit>().formKey.currentState!.validate()) {
        context.read<VerifyOtpCubit>().emitVerifyOtpStates();
      }
    }
  }
}
