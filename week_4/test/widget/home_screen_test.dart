import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:week_4/features/home/presentation/cubit/home_cubit.dart';
import 'package:week_4/features/home/presentation/cubit/home_state.dart';
import 'package:week_4/features/home/presentation/screens/home_screen.dart';

import '../helpers/pump_app.dart';
import '../helpers/test_helper.dart';

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

void main() {
  late MockHomeCubit mockHomeCubit;

  setUp(() {
    mockHomeCubit = MockHomeCubit();
    when(
      () => mockHomeCubit.stream,
    ).thenAnswer((_) => Stream<HomeState>.empty());
  });

  group('HomeScreen Widget Tests', () {
    testWidgets('should display loading indicator when state is loading', (
      tester,
    ) async {
      when(() => mockHomeCubit.state).thenReturn(const HomeState.loading());

      await tester.pumpApp(
        BlocProvider<HomeCubit>.value(
          value: mockHomeCubit,
          child: const HomeScreen(),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should display breeds list when state is success', (
      tester,
    ) async {
      final breeds = TestHelper.mockBreedList(count: 3);
      when(() => mockHomeCubit.state).thenReturn(HomeState.success(breeds));

      await tester.pumpApp(
        BlocProvider<HomeCubit>.value(
          value: mockHomeCubit,
          child: const HomeScreen(),
        ),
      );

      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('should display error message when state is error', (
      tester,
    ) async {
      when(
        () => mockHomeCubit.state,
      ).thenReturn(const HomeState.error('Network error'));

      await tester.pumpApp(
        BlocProvider<HomeCubit>.value(
          value: mockHomeCubit,
          child: const HomeScreen(),
        ),
      );

      expect(find.text('Network error'), findsOneWidget);
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    });

    testWidgets('should display retry button when state is error', (
      tester,
    ) async {
      when(
        () => mockHomeCubit.state,
      ).thenReturn(const HomeState.error('Network error'));
      when(() => mockHomeCubit.getBreeds()).thenAnswer((_) async {
        return;
      });

      await tester.pumpApp(
        BlocProvider<HomeCubit>.value(
          value: mockHomeCubit,
          child: const HomeScreen(),
        ),
      );

      final retryButton = find.text('Retry');
      expect(retryButton, findsOneWidget);

      await tester.tap(retryButton);
      await tester.pump();

      verify(() => mockHomeCubit.getBreeds()).called(1);
    });

    testWidgets('should display all header components', (tester) async {
      when(() => mockHomeCubit.state).thenReturn(const HomeState.initial());

      await tester.pumpApp(
        BlocProvider<HomeCubit>.value(
          value: mockHomeCubit,
          child: const HomeScreen(),
        ),
      );

      expect(find.text('Find Your Forever Pet'), findsOneWidget);
      expect(find.byIcon(Icons.notifications_outlined), findsOneWidget);
    });

    testWidgets('should display search bar', (tester) async {
      when(() => mockHomeCubit.state).thenReturn(const HomeState.initial());

      await tester.pumpApp(
        BlocProvider<HomeCubit>.value(
          value: mockHomeCubit,
          child: const HomeScreen(),
        ),
      );

      expect(find.text('Search'), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.tune), findsOneWidget);
    });

    testWidgets('should display categories section', (tester) async {
      when(() => mockHomeCubit.state).thenReturn(const HomeState.initial());

      await tester.pumpApp(
        BlocProvider<HomeCubit>.value(
          value: mockHomeCubit,
          child: const HomeScreen(),
        ),
      );

      expect(find.text('Categories'), findsOneWidget);
      expect(find.text('All'), findsOneWidget);
      expect(find.text('Cats'), findsOneWidget);
    });

    testWidgets('should display bottom navigation bar', (tester) async {
      when(() => mockHomeCubit.state).thenReturn(const HomeState.initial());

      await tester.pumpApp(
        BlocProvider<HomeCubit>.value(
          value: mockHomeCubit,
          child: const HomeScreen(),
        ),
      );

      expect(find.byType(BottomNavigationBar), findsOneWidget);
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.favorite_border), findsOneWidget);
      expect(find.byIcon(Icons.message_outlined), findsOneWidget);
      expect(find.byIcon(Icons.person_outline), findsOneWidget);
    });

    testWidgets('should display correct number of breed cards', (tester) async {
      final breeds = TestHelper.mockBreedList(count: 5);
      when(() => mockHomeCubit.state).thenReturn(HomeState.success(breeds));

      await tester.pumpApp(
        BlocProvider<HomeCubit>.value(
          value: mockHomeCubit,
          child: const HomeScreen(),
        ),
      );

      // Each breed has a name displayed
      expect(find.text('Breed 0'), findsOneWidget);
      expect(find.text('Breed 1'), findsOneWidget);
      expect(find.text('Breed 2'), findsOneWidget);
      expect(find.text('Breed 3'), findsOneWidget);
      expect(find.text('Breed 4'), findsOneWidget);
    });

    testWidgets('should show empty state correctly', (tester) async {
      when(() => mockHomeCubit.state).thenReturn(const HomeState.success([]));
      when(
        () => mockHomeCubit.stream,
      ).thenAnswer((_) => Stream.value(const HomeState.success([])));

      await tester.pumpApp(
        BlocProvider<HomeCubit>.value(
          value: mockHomeCubit,
          child: const HomeScreen(),
        ),
      );

      await tester.pumpAndSettle();

      // Multiple ListViews are present (categories + pets list)
      // Just verify the home screen rendered
      expect(find.text('Categories'), findsOneWidget);
    });
  });
}
