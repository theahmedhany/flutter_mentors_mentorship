import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:week_4/core/networking/api_error_model.dart';
import 'package:week_4/core/networking/api_result.dart';
import 'package:week_4/features/home/domain/repos/home_repo.dart';
import 'package:week_4/features/home/presentation/cubit/home_cubit.dart';
import 'package:week_4/features/home/presentation/cubit/home_state.dart';

import '../../helpers/test_helper.dart';

class MockHomeRepo extends Mock implements HomeRepo {}

void main() {
  late HomeCubit homeCubit;
  late MockHomeRepo mockHomeRepo;

  setUp(() {
    mockHomeRepo = MockHomeRepo();
    homeCubit = HomeCubit(mockHomeRepo);
  });

  tearDown(() {
    homeCubit.close();
  });

  group('HomeCubit', () {
    test('initial state is HomeState.initial', () {
      expect(homeCubit.state, equals(const HomeState.initial()));
    });

    blocTest<HomeCubit, HomeState>(
      'emits [loading, success] when getBreeds is successful',
      build: () {
        final mockBreeds = TestHelper.mockBreedList(count: 3);
        when(
          () => mockHomeRepo.getBreeds(any(), any()),
        ).thenAnswer((_) async => ApiResult.success(mockBreeds));
        return homeCubit;
      },
      act: (cubit) => cubit.getBreeds(),
      expect: () => [
        const HomeState.loading(),
        isA<HomeState>().having(
          (state) => state.maybeWhen(
            success: (breeds) => breeds.length,
            orElse: () => null,
          ),
          'breeds count',
          3,
        ),
      ],
      verify: (_) {
        verify(() => mockHomeRepo.getBreeds(20, 0)).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'emits [loading, error] when getBreeds fails',
      build: () {
        when(() => mockHomeRepo.getBreeds(any(), any())).thenAnswer(
          (_) async =>
              ApiResult.failure(ApiErrorModel(message: 'Network error')),
        );
        return homeCubit;
      },
      act: (cubit) => cubit.getBreeds(),
      expect: () => [
        const HomeState.loading(),
        const HomeState.error('Network error'),
      ],
      verify: (_) {
        verify(() => mockHomeRepo.getBreeds(20, 0)).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'uses custom limit and page when provided',
      build: () {
        final mockBreeds = TestHelper.mockBreedList(count: 5);
        when(
          () => mockHomeRepo.getBreeds(any(), any()),
        ).thenAnswer((_) async => ApiResult.success(mockBreeds));
        return homeCubit;
      },
      act: (cubit) => cubit.getBreeds(limit: 10, page: 2),
      verify: (_) {
        verify(() => mockHomeRepo.getBreeds(10, 2)).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'emits correct breeds data in success state',
      build: () {
        final mockBreeds = TestHelper.mockBreedList(count: 2);
        when(
          () => mockHomeRepo.getBreeds(any(), any()),
        ).thenAnswer((_) async => ApiResult.success(mockBreeds));
        return homeCubit;
      },
      act: (cubit) => cubit.getBreeds(),
      expect: () => [
        const HomeState.loading(),
        isA<HomeState>().having(
          (state) =>
              state.maybeWhen(success: (breeds) => breeds, orElse: () => null),
          'breeds data',
          isA<List>().having((list) => list.length, 'length', 2),
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'handles empty breeds list',
      build: () {
        when(
          () => mockHomeRepo.getBreeds(any(), any()),
        ).thenAnswer((_) async => const ApiResult.success([]));
        return homeCubit;
      },
      act: (cubit) => cubit.getBreeds(),
      expect: () => [
        const HomeState.loading(),
        isA<HomeState>().having(
          (state) => state.maybeWhen(
            success: (breeds) => breeds.isEmpty,
            orElse: () => false,
          ),
          'empty breeds',
          true,
        ),
      ],
    );
  });
}
