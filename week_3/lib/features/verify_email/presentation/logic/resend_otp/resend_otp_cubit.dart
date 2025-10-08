import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../data/models/resend_otp/resend_otp_request_body.dart';
import '../../../data/repos/resend_otp_repo.dart';
import 'resend_otp_state.dart';

class ResendOtpCubit extends Cubit<ResendOtpState> {
  final ResendOtpRepo _resendOtpRepo;
  ResendOtpCubit(this._resendOtpRepo) : super(const ResendOtpState.idle());

  TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitResendOtpStates() async {
    if (!formKey.currentState!.validate()) return;

    emit(const ResendOtpState.loading());
    try {
      final response = await _resendOtpRepo.resendOtp(
        ResendOtpRequestBody(email: emailController.text.trim()),
      );

      response.when(
        success: (resendOtpResponse) async {
          emit(ResendOtpState.success(resendOtpResponse));
        },
        failure: (error) {
          emit(
            ResendOtpState.error(
              error:
                  error.message ??
                  "An unexpected error occurred. Please try again.",
            ),
          );
        },
      );
    } catch (e) {
      emit(
        ResendOtpState.error(
          error: "An unexpected error occurred. Please try again.",
        ),
      );
    }
  }
}
