import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            message: 'Connection timeout. Please try again.',
          );
        case DioExceptionType.badResponse:
          return _handleBadResponse(error.response);
        case DioExceptionType.cancel:
          return ApiErrorModel(message: 'Request cancelled');
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: 'No internet connection');
        case DioExceptionType.badCertificate:
          return ApiErrorModel(message: 'Bad certificate');
        case DioExceptionType.unknown:
          return ApiErrorModel(
            message: 'Something went wrong. Please try again.',
          );
      }
    } else {
      return ApiErrorModel(message: 'Unexpected error occurred');
    }
  }

  static ApiErrorModel _handleBadResponse(Response? response) {
    if (response == null) {
      return ApiErrorModel(message: 'No response from server');
    }

    switch (response.statusCode) {
      case 400:
        return ApiErrorModel(message: 'Bad request');
      case 401:
        return ApiErrorModel(message: 'Unauthorized');
      case 403:
        return ApiErrorModel(message: 'Forbidden');
      case 404:
        return ApiErrorModel(message: 'Not found');
      case 500:
        return ApiErrorModel(message: 'Internal server error');
      default:
        return ApiErrorModel(message: 'Error: ${response.statusCode}');
    }
  }
}
