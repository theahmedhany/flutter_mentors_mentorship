import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_4/core/networking/api_error_handler.dart';

void main() {
  group('ApiErrorHandler', () {
    test('should handle connection timeout error', () {
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.connectionTimeout,
      );

      final result = ApiErrorHandler.handle(error);

      expect(result.message, 'Connection timeout. Please try again.');
    });

    test('should handle send timeout error', () {
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.sendTimeout,
      );

      final result = ApiErrorHandler.handle(error);

      expect(result.message, 'Connection timeout. Please try again.');
    });

    test('should handle receive timeout error', () {
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.receiveTimeout,
      );

      final result = ApiErrorHandler.handle(error);

      expect(result.message, 'Connection timeout. Please try again.');
    });

    test('should handle cancelled request', () {
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.cancel,
      );

      final result = ApiErrorHandler.handle(error);

      expect(result.message, 'Request cancelled');
    });

    test('should handle connection error', () {
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.connectionError,
      );

      final result = ApiErrorHandler.handle(error);

      expect(result.message, 'No internet connection');
    });

    test('should handle bad certificate error', () {
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badCertificate,
      );

      final result = ApiErrorHandler.handle(error);

      expect(result.message, 'Bad certificate');
    });

    test('should handle unknown error', () {
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.unknown,
      );

      final result = ApiErrorHandler.handle(error);

      expect(result.message, 'Something went wrong. Please try again.');
    });

    test('should handle 400 bad request', () {
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 400,
        ),
      );

      final result = ApiErrorHandler.handle(error);

      expect(result.message, 'Bad request');
    });

    test('should handle 401 unauthorized', () {
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 401,
        ),
      );

      final result = ApiErrorHandler.handle(error);

      expect(result.message, 'Unauthorized');
    });

    test('should handle 403 forbidden', () {
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 403,
        ),
      );

      final result = ApiErrorHandler.handle(error);

      expect(result.message, 'Forbidden');
    });

    test('should handle 404 not found', () {
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 404,
        ),
      );

      final result = ApiErrorHandler.handle(error);

      expect(result.message, 'Not found');
    });

    test('should handle 500 internal server error', () {
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 500,
        ),
      );

      final result = ApiErrorHandler.handle(error);

      expect(result.message, 'Internal server error');
    });

    test('should handle generic bad response', () {
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 418,
        ),
      );

      final result = ApiErrorHandler.handle(error);

      expect(result.message, 'Error: 418');
    });

    test('should handle non-DioException error', () {
      final error = Exception('Generic error');

      final result = ApiErrorHandler.handle(error);

      expect(result.message, 'Unexpected error occurred');
    });

    test('should handle null response in bad response', () {
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
      );

      final result = ApiErrorHandler.handle(error);

      expect(result.message, 'No response from server');
    });
  });
}
