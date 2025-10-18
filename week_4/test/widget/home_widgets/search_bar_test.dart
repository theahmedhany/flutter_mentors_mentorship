import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_4/features/home/presentation/widgets/search_bar_with_filter.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('SearchBarWithFilter Widget Tests', () {
    testWidgets('should display search hint text', (tester) async {
      await tester.pumpApp(const SearchBarWithFilter());

      expect(find.text('Search'), findsOneWidget);
    });

    testWidgets('should display search icon', (tester) async {
      await tester.pumpApp(const SearchBarWithFilter());

      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('should display filter icon', (tester) async {
      await tester.pumpApp(const SearchBarWithFilter());

      expect(find.byIcon(Icons.tune), findsOneWidget);
    });

    testWidgets('should accept text input', (tester) async {
      await tester.pumpApp(const SearchBarWithFilter());

      final textField = find.byType(TextField);
      expect(textField, findsOneWidget);

      await tester.enterText(textField, 'Siamese');
      expect(find.text('Siamese'), findsOneWidget);
    });

    testWidgets('should have search and filter in a row', (tester) async {
      await tester.pumpApp(const SearchBarWithFilter());

      final row = find.byType(Row);
      expect(row, findsOneWidget);
    });
  });
}
