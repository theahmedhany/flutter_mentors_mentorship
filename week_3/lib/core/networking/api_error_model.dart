import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final int? statusCode;
  final String? message;
  final ApiErrorDetails? errors;

  ApiErrorModel({this.statusCode, this.message, this.errors});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}

@JsonSerializable()
class ApiErrorDetails {
  final List<String>? generalErrors;

  ApiErrorDetails({this.generalErrors});

  factory ApiErrorDetails.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorDetailsToJson(this);
}
