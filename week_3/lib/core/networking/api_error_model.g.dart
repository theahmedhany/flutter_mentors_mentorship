// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorModel _$ApiErrorModelFromJson(Map<String, dynamic> json) =>
    ApiErrorModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      errors: json['errors'] == null
          ? null
          : ApiErrorDetails.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiErrorModelToJson(ApiErrorModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'errors': instance.errors,
    };

ApiErrorDetails _$ApiErrorDetailsFromJson(Map<String, dynamic> json) =>
    ApiErrorDetails(
      generalErrors: (json['generalErrors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ApiErrorDetailsToJson(ApiErrorDetails instance) =>
    <String, dynamic>{'generalErrors': instance.generalErrors};
