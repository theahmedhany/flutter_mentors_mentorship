import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:week_3/core/common/widgets/custom_app_button.dart';
import 'package:week_3/core/helpers/spacing.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';
import 'package:week_3/core/theme/app_texts/app_text_styles.dart';

class OtpScreen extends StatefulWidget {
  final String? email;
  const OtpScreen({super.key, this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _errorMessage;

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

  void _validateAndProceed() {
    final otp = _otpController.text;

    if (otp.length < 6) {
      setState(() {
        _errorMessage = "Please enter a valid 6-digit code.";
      });
    } else {
      setState(() {
        _errorMessage = null;
      });
    }
  }

  @override
  void dispose() {
    _otpController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

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
            child: Form(
              key: _formKey,
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

                  Center(
                    child: Pinput(
                      controller: _otpController,
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
                          _otpController.clear();
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

                  verticalSpace(24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
