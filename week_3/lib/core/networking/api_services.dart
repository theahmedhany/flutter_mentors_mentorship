import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:week_3/features/login/data/models/login_request_body.dart';
import 'package:week_3/features/login/data/models/login_response.dart';
import 'package:week_3/features/signup/data/models/signup_request_body.dart';
import 'package:week_3/features/signup/data/models/signup_response.dart';
import 'package:week_3/features/verify_email/data/models/resend_otp/resend_otp_request_body.dart';
import 'package:week_3/features/verify_email/data/models/verify_otp/verify_otp_request_body.dart';

import 'api_constants.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  // Login API
  @POST(ApiConstants.apiLogin)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  // Signup API
  @POST(ApiConstants.apiSignup)
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);

  // Resend Otp API
  @POST(ApiConstants.apiResendOtp)
  Future<String> resendOtp(@Body() ResendOtpRequestBody resendOtpRequestBody);

  // Verify Email API
  @POST(ApiConstants.apiVerifyEmail)
  Future<String> verifyEmail(@Body() VerifyOtpRequestBody verifyOtpRequestBody);

  // Student Written Exam Submissions API
  // @GET(ApiConstants.apiStudentWrittenExamSubmissions)
  // Future<List<StudentWrittenSubmissionsModel>> getStudentWrittenExamSubmissions(
  //   @Query('examId') String examId,
  // );

  // All Notifications API
  // @GET(ApiConstants.apiAllNotifications)
  // Future<List<NotificationsModel>> getAllNotifications();
}
