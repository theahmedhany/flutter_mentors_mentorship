import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/custom_alert_dialog.dart';
import '../../../../core/common/widgets/custom_loading.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors/light_app_colors.dart';
import '../logic/signup_cubit.dart';
import '../logic/signup_state.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => _showLoadingDialog(context),
          success: (loginResponse) {
            showSuccessDialog(context);
          },
          error: (error) => _showErrorDialog(context, error),
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void _showErrorDialog(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        dialogColor: Colors.redAccent,
        dialogHeader: 'Signup Failed',
        dialogBody: error,
        dialogIcon: Icons.error,
        press: () => context.pop(),
      ),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: LightAppColors.primary500.withValues(alpha: 0.3),
      builder: (context) => Center(child: const CustomLoading()),
    );
  }

  void showSuccessDialog(BuildContext context) {
    context.pop();

    context.pushReplacementNamed(
      Routes.otpScreen,
      arguments: context.read<SignupCubit>().emailController.text.trim(),
    );

    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        dialogColor: LightAppColors.primary500,
        dialogHeader: 'Signup Successful',
        dialogBody:
            'Congratulations, you have signed up successfully!\nAn OTP has been sent to your email inbox. Please use it to verify your email.',
        dialogIcon: Icons.check_circle_rounded,
        press: () {
          context.pop();
        },
      ),
    );
  }
}
