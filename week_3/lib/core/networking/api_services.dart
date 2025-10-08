import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:week_3/features/brands/data/models/brands_model.dart';
import 'package:week_3/features/details/data/models/product_details_model.dart';
import 'package:week_3/features/login/data/models/login_request_body.dart';
import 'package:week_3/features/login/data/models/login_response.dart';
import 'package:week_3/features/products/data/models/products_models.dart';
import 'package:week_3/features/profile/data/models/user_profile_model.dart';
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

  // User Profile API
  @GET(ApiConstants.apiUserDetails)
  Future<UserProfileModel> getUserProfile();

  // All Brands API
  @GET(ApiConstants.apiCategories)
  Future<BrandsModel> getAllBrands();

  // All Products API
  @GET(ApiConstants.apiProducts)
  Future<ProductsModels> getAllProducts();

  // Get Product Details API
  @GET('${ApiConstants.apiProducts}/{Id}')
  Future<ProductDetailsModel> getProductDetails(@Path('Id') String productId);
}
