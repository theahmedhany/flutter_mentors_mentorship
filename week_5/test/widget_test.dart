import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:week_5/main.dart';

void main() {
  testWidgets('App should launch successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const UStockApp());

    // Verify that the app launches
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
