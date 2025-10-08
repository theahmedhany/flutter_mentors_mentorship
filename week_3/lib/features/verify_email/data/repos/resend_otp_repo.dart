import 'package:week_3/features/verify_email/data/models/resend_otp/resend_otp_request_body.dart';

import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';

class ResendOtpRepo {
  final ApiServices _apiServices;

  ResendOtpRepo(this._apiServices);

  Future<ApiResult<String>> resendOtp(
    ResendOtpRequestBody resendOtpRequestBody,
  ) async {
    try {
      final response = await _apiServices.resendOtp(resendOtpRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
