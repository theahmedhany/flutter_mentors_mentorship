import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_4/core/widgets/bottom_nav_bar.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('BottomNavBar Widget Tests', () {
    testWidgets('should render all 4 navigation items', (tester) async {
      await tester.pumpApp(BottomNavBar(currentIndex: 0, onTap: (_) {}));

      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.favorite_border), findsOneWidget);
      expect(find.byIcon(Icons.message_outlined), findsOneWidget);
      expect(find.byIcon(Icons.person_outline), findsOneWidget);
    });

    testWidgets('should highlight selected item', (tester) async {
      await tester.pumpApp(BottomNavBar(currentIndex: 1, onTap: (_) {}));

      final bottomNavBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNavBar.currentIndex, 1);
    });

    testWidgets('should call onTap when item is tapped', (tester) async {
      int tappedIndex = -1;

      await tester.pumpApp(
        BottomNavBar(currentIndex: 0, onTap: (index) => tappedIndex = index),
      );

      // Tap the favorites icon (index 1)
      await tester.tap(find.byIcon(Icons.favorite_border));
      await tester.pump();

      expect(tappedIndex, 1);
    });

    testWidgets('should update currentIndex when different item is selected', (
      tester,
    ) async {
      int currentIndex = 0;

      await tester.pumpApp(
        StatefulBuilder(
          builder: (context, setState) {
            return BottomNavBar(
              currentIndex: currentIndex,
              onTap: (index) => setState(() => currentIndex = index),
            );
          },
        ),
      );

      // Initially on home (index 0)
      var bottomNavBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNavBar.currentIndex, 0);

      // Tap messages (index 2)
      await tester.tap(find.byIcon(Icons.message_outlined));
      await tester.pump();

      bottomNavBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNavBar.currentIndex, 2);
    });

    testWidgets('should not show labels', (tester) async {
      await tester.pumpApp(BottomNavBar(currentIndex: 0, onTap: (_) {}));

      final bottomNavBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNavBar.showSelectedLabels, isFalse);
      expect(bottomNavBar.showUnselectedLabels, isFalse);
    });

    testWidgets('should have fixed type', (tester) async {
      await tester.pumpApp(BottomNavBar(currentIndex: 0, onTap: (_) {}));

      final bottomNavBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNavBar.type, BottomNavigationBarType.fixed);
    });

    testWidgets('should be wrapped in SafeArea', (tester) async {
      await tester.pumpApp(BottomNavBar(currentIndex: 0, onTap: (_) {}));

      expect(find.byType(SafeArea), findsOneWidget);
    });
  });
}
