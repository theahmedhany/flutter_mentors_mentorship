import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:week_4/core/networking/api_error_model.dart';
import 'package:week_4/features/home/data/apis/home_api_service.dart';
import 'package:week_4/features/home/data/repos/home_repo_impl.dart';

import '../../helpers/test_helper.dart';

class MockHomeApiService extends Mock implements HomeApiService {}

void main() {
  late HomeRepoImpl repository;
  late MockHomeApiService mockApiService;

  setUp(() {
    mockApiService = MockHomeApiService();
    repository = HomeRepoImpl(mockApiService);
  });

  group('HomeRepoImpl', () {
    group('getBreeds', () {
      test(
        'should return ApiResult.success when API call is successful',
        () async {
          // Arrange
          final mockBreeds = TestHelper.mockBreedList(count: 3);
          when(
            () => mockApiService.getBreeds(20, 0),
          ).thenAnswer((_) async => mockBreeds);

          // Act
          final result = await repository.getBreeds(20, 0);

          // Assert
          expect(result, isNotNull);
          result.when(
            success: (breeds) {
              expect(breeds, equals(mockBreeds));
              expect(breeds.length, 3);
            },
            failure: (_) => fail('Should not return failure'),
          );
          verify(() => mockApiService.getBreeds(20, 0)).called(1);
        },
      );

      test(
        'should return ApiResult.failure when API call throws DioException',
        () async {
          // Arrange
          final dioException = DioException(
            requestOptions: RequestOptions(path: '/breeds'),
            type: DioExceptionType.connectionTimeout,
          );
          when(() => mockApiService.getBreeds(20, 0)).thenThrow(dioException);

          // Act
          final result = await repository.getBreeds(20, 0);

          // Assert
          result.when(
            success: (_) => fail('Should not return success'),
            failure: (error) {
              expect(error, isA<ApiErrorModel>());
              expect(error.message, isNotEmpty);
            },
          );
          verify(() => mockApiService.getBreeds(20, 0)).called(1);
        },
      );

      test(
        'should return ApiResult.failure when API call throws generic error',
        () async {
          // Arrange
          when(
            () => mockApiService.getBreeds(20, 0),
          ).thenThrow(Exception('Network error'));

          // Act
          final result = await repository.getBreeds(20, 0);

          // Assert
          result.when(
            success: (_) => fail('Should not return success'),
            failure: (error) {
              expect(error, isA<ApiErrorModel>());
              expect(error.message, isNotEmpty);
            },
          );
          verify(() => mockApiService.getBreeds(20, 0)).called(1);
        },
      );

      test('should pass correct parameters to API service', () async {
        // Arrange
        final mockBreeds = TestHelper.mockBreedList(count: 5);
        when(
          () => mockApiService.getBreeds(10, 2),
        ).thenAnswer((_) async => mockBreeds);

        // Act
        await repository.getBreeds(10, 2);

        // Assert
        verify(() => mockApiService.getBreeds(10, 2)).called(1);
      });
    });
  });
}
