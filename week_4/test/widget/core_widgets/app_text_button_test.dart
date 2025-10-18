import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_4/core/theming/app_colors.dart';
import 'package:week_4/core/widgets/app_text_button.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppTextButton Widget Tests', () {
    testWidgets('should display button text', (tester) async {
      await tester.pumpApp(const AppTextButton(buttonText: 'Test Button'));

      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('should call onPressed when tapped', (tester) async {
      var wasPressed = false;

      await tester.pumpApp(
        AppTextButton(buttonText: 'Tap Me', onPressed: () => wasPressed = true),
      );

      await tester.tap(find.text('Tap Me'));
      await tester.pump();

      expect(wasPressed, isTrue);
    });

    testWidgets('should not call onPressed when isLoading is true', (
      tester,
    ) async {
      var wasPressed = false;

      await tester.pumpApp(
        AppTextButton(
          buttonText: 'Loading',
          onPressed: () => wasPressed = true,
          isLoading: true,
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(wasPressed, isFalse);
    });

    testWidgets(
      'should show CircularProgressIndicator when isLoading is true',
      (tester) async {
        await tester.pumpApp(
          const AppTextButton(buttonText: 'Loading', isLoading: true),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.text('Loading'), findsNothing);
      },
    );

    testWidgets('should apply custom background color', (tester) async {
      await tester.pumpApp(
        const AppTextButton(
          buttonText: 'Custom Color',
          backgroundColor: Colors.red,
        ),
      );

      final elevatedButton = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      final backgroundColor = elevatedButton.style?.backgroundColor?.resolve(
        {},
      );

      expect(backgroundColor, Colors.red);
    });

    testWidgets('should use default mainTeal color when no color is provided', (
      tester,
    ) async {
      await tester.pumpApp(const AppTextButton(buttonText: 'Default Color'));

      final elevatedButton = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      final backgroundColor = elevatedButton.style?.backgroundColor?.resolve(
        {},
      );

      expect(backgroundColor, AppColors.mainTeal);
    });

    testWidgets('should be disabled when onPressed is null', (tester) async {
      await tester.pumpApp(
        const AppTextButton(buttonText: 'Disabled', onPressed: null),
      );

      final elevatedButton = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      expect(elevatedButton.onPressed, isNull);
    });

    testWidgets('should apply custom text style', (tester) async {
      const customStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

      await tester.pumpApp(
        const AppTextButton(buttonText: 'Custom Style', textStyle: customStyle),
      );

      final textWidget = tester.widget<Text>(find.text('Custom Style'));
      expect(textWidget.style?.fontSize, 20);
      expect(textWidget.style?.fontWeight, FontWeight.bold);
    });
  });
}
