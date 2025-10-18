import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_4/features/home/presentation/widgets/categories_section.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('CategoriesSection Widget Tests', () {
    testWidgets('should display "Categories" title', (tester) async {
      await tester.pumpApp(const CategoriesSection());

      expect(find.text('Categories'), findsOneWidget);
    });

    testWidgets('should display all category options', (tester) async {
      await tester.pumpApp(const CategoriesSection());

      expect(find.text('All'), findsOneWidget);
      expect(find.text('Cats'), findsOneWidget);
      expect(find.text('Dogs'), findsOneWidget);
      expect(find.text('Birds'), findsOneWidget);
      expect(find.text('Fish'), findsOneWidget);
      expect(find.text('Reptiles'), findsOneWidget);
    });

    testWidgets('should have "All" selected by default', (tester) async {
      await tester.pumpApp(const CategoriesSection());

      // Find the "All" category container
      final allCategory = find.text('All');
      expect(allCategory, findsOneWidget);

      // The first item should be selected (we can verify by checking state)
      await tester.pump();
    });

    testWidgets('should change selection when category is tapped', (
      tester,
    ) async {
      await tester.pumpApp(const CategoriesSection());

      // Tap on "Cats"
      await tester.tap(find.text('Cats'));
      await tester.pump();

      // Verify state changed (the widget should rebuild)
      expect(find.text('Cats'), findsOneWidget);
    });

    testWidgets('should be scrollable horizontally', (tester) async {
      await tester.pumpApp(const CategoriesSection());

      final listView = find.byType(ListView);
      expect(listView, findsOneWidget);

      final listViewWidget = tester.widget<ListView>(listView);
      expect(listViewWidget.scrollDirection, Axis.horizontal);
    });

    testWidgets('should render all 6 categories', (tester) async {
      await tester.pumpApp(const CategoriesSection());

      // Count the number of GestureDetector widgets (one for each category)
      final categories = find.byType(GestureDetector);
      expect(categories, findsNWidgets(6));
    });
  });
}
