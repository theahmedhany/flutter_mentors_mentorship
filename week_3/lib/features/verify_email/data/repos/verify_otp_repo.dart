import 'package:week_3/features/verify_email/data/models/verify_otp/verify_otp_request_body.dart';

import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';

class VerifyOtpRepo {
  final ApiServices _apiServices;

  VerifyOtpRepo(this._apiServices);

  Future<ApiResult<String>> verifyEmail(
    VerifyOtpRequestBody verifyOtpRequestBody,
  ) async {
    try {
      final response = await _apiServices.verifyEmail(verifyOtpRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
