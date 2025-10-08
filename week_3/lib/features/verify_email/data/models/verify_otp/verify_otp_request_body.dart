import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_request_body.g.dart';

@JsonSerializable()
class VerifyOtpRequestBody {
  final String email;
  final String otp;

  VerifyOtpRequestBody({required this.email, required this.otp});

  factory VerifyOtpRequestBody.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpRequestBodyToJson(this);
}
