import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3/core/common/widgets/custom_app_button.dart';
import 'package:week_3/core/common/widgets/custom_text_form_field.dart';
import 'package:week_3/core/helpers/app_regex.dart';
import 'package:week_3/core/helpers/spacing.dart';
import 'package:week_3/features/verify_email/presentation/logic/resend_otp/resend_otp_cubit.dart';
import 'package:week_3/features/verify_email/presentation/widgets/verify_email_bloc_listener.dart';

class CustomVerifyEmailForm extends StatelessWidget {
  const CustomVerifyEmailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ResendOtpCubit>().formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: CustomTextFormField(
              hintText: 'Email',
              label: '',
              controller: context.read<ResendOtpCubit>().emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                final trimmedValue = value?.trim() ?? '';
                if (trimmedValue.isEmpty ||
                    !AppRegex.isEmailValid(trimmedValue)) {
                  return 'Please enter a valid email.';
                }
                return null;
              },
            ),
          ),

          verticalSpace(60),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: CustomAppButton(
              onPress: () {
                validateThenDoNavigation(context);
              },
              text: 'Verify Email',
            ),
          ),

          VerifyEmailBlocListener(),
        ],
      ),
    );
  }

  void validateThenDoNavigation(BuildContext context) {
    if (context.read<ResendOtpCubit>().formKey.currentState!.validate()) {
      context.read<ResendOtpCubit>().emitResendOtpStates();
    }
  }
}
