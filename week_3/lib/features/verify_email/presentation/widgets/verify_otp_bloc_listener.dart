import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week_3/core/common/widgets/custom_alert_dialog.dart';
import 'package:week_3/core/common/widgets/custom_loading.dart';
import 'package:week_3/core/routing/routes.dart';
import 'package:week_3/core/theme/app_colors/light_app_colors.dart';
import 'package:week_3/features/verify_email/presentation/logic/verify_otp/verify_otp_cubit.dart';
import 'package:week_3/features/verify_email/presentation/logic/verify_otp/verify_otp_state.dart';

import '../../../../core/helpers/extensions.dart';

class VerifyOtpBlocListener extends StatelessWidget {
  const VerifyOtpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyOtpCubit, VerifyOtpState>(
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
        dialogHeader: 'Verification Failed',
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

    context.pushReplacementNamed(Routes.loginScreen);

    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        dialogColor: LightAppColors.primary500,
        dialogHeader: 'Verification Successful',
        dialogBody:
            'Congratulations, you have verified your email successfully!\n You can now log in to your account.',
        dialogIcon: Icons.check_circle_rounded,
        press: () {
          context.pop();
        },
      ),
    );
  }
}
