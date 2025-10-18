import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_4/features/home/presentation/widgets/pet_card.dart';

import '../../helpers/pump_app.dart';
import '../../helpers/test_helper.dart';

void main() {
  group('PetCard Widget Tests', () {
    testWidgets('should display breed name', (tester) async {
      final breed = TestHelper.mockBreed(name: 'Siamese');

      await tester.pumpApp(PetCard(breed: breed));

      expect(find.text('Siamese'), findsOneWidget);
    });

    testWidgets('should display breed lifespan', (tester) async {
      final breed = TestHelper.mockBreed(lifeSpan: '12 - 15 years');

      await tester.pumpApp(PetCard(breed: breed));

      expect(find.text('12 - 15 years'), findsOneWidget);
    });

    testWidgets('should display "Unknown age" when lifeSpan is null', (
      tester,
    ) async {
      final breed = TestHelper.mockBreed(lifeSpan: null);

      await tester.pumpApp(PetCard(breed: breed));

      expect(find.text('Unknown age'), findsOneWidget);
    });

    testWidgets('should display breed origin', (tester) async {
      final breed = TestHelper.mockBreed(origin: 'Thailand');

      await tester.pumpApp(PetCard(breed: breed));

      expect(find.text('Thailand'), findsOneWidget);
    });

    testWidgets('should display "Unknown location" when origin is null', (
      tester,
    ) async {
      final breed = TestHelper.mockBreed(origin: null);

      await tester.pumpApp(PetCard(breed: breed));

      expect(find.text('Unknown location'), findsOneWidget);
    });

    testWidgets('should display favorite button', (tester) async {
      final breed = TestHelper.mockBreed();

      await tester.pumpApp(PetCard(breed: breed));

      expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    });

    testWidgets('should display location icon', (tester) async {
      final breed = TestHelper.mockBreed();

      await tester.pumpApp(PetCard(breed: breed));

      expect(find.byIcon(Icons.location_on), findsOneWidget);
    });

    testWidgets('should handle missing image gracefully', (tester) async {
      final breed = TestHelper.mockBreed(referenceImageId: null);

      await tester.pumpApp(PetCard(breed: breed));
      await tester.pump();

      // Should show placeholder icon
      expect(find.byIcon(Icons.pets), findsOneWidget);
    });

    testWidgets('should display temperament as gender/age substitute', (
      tester,
    ) async {
      final breed = TestHelper.mockBreed(temperament: 'Playful, Friendly');

      await tester.pumpApp(PetCard(breed: breed));

      expect(find.text('Playful'), findsOneWidget);
    });

    testWidgets('should handle null temperament', (tester) async {
      final breed = TestHelper.mockBreed(temperament: null);

      await tester.pumpApp(PetCard(breed: breed));

      expect(find.text('Unknown'), findsOneWidget);
    });
  });
}
