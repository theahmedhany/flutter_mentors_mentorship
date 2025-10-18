import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_4/features/home/presentation/widgets/home_header.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('HomeHeader Widget Tests', () {
    testWidgets('should display title "Find Your Forever Pet"', (tester) async {
      await tester.pumpApp(const HomeHeader());

      expect(find.text('Find Your Forever Pet'), findsOneWidget);
    });

    testWidgets('should display notification icon', (tester) async {
      await tester.pumpApp(const HomeHeader());

      expect(find.byIcon(Icons.notifications_outlined), findsOneWidget);
    });

    testWidgets('should have clickable notification button', (tester) async {
      await tester.pumpApp(const HomeHeader());

      final notificationButton = find.byType(IconButton);
      expect(notificationButton, findsOneWidget);

      // Verify it's tappable
      await tester.tap(notificationButton);
      await tester.pump();
    });
  });
}
