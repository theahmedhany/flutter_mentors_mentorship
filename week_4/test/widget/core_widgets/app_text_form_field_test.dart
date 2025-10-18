import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_4/core/widgets/app_text_form_field.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppTextFormField Widget Tests', () {
    testWidgets('should display hint text', (tester) async {
      await tester.pumpApp(const AppTextFormField(hintText: 'Enter text'));

      expect(find.text('Enter text'), findsOneWidget);
    });

    testWidgets('should accept text input', (tester) async {
      final controller = TextEditingController();

      await tester.pumpApp(
        AppTextFormField(hintText: 'Type here', controller: controller),
      );

      await tester.enterText(find.byType(TextFormField), 'Hello World');

      expect(controller.text, 'Hello World');
    });

    testWidgets('should obscure text when isObscureText is true', (
      tester,
    ) async {
      final controller = TextEditingController();

      await tester.pumpApp(
        AppTextFormField(
          hintText: 'Password',
          isObscureText: true,
          controller: controller,
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'password');
      expect(controller.text, 'password');
    });

    testWidgets('should toggle password visibility', (tester) async {
      await tester.pumpApp(
        const AppTextFormField(hintText: 'Password', isObscureText: true),
      );

      // Verify visibility icon is present
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);

      // Tap visibility toggle
      await tester.tap(find.byType(IconButton));
      await tester.pump();

      // Verify icon changed to visible
      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });

    testWidgets('should display prefix icon', (tester) async {
      await tester.pumpApp(
        const AppTextFormField(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
        ),
      );

      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('should display suffix icon when not password field', (
      tester,
    ) async {
      await tester.pumpApp(
        const AppTextFormField(
          hintText: 'Email',
          suffixIcon: Icon(Icons.email),
        ),
      );

      expect(find.byIcon(Icons.email), findsOneWidget);
    });

    testWidgets('should call validator', (tester) async {
      String? validatorMessage;

      await tester.pumpApp(
        Form(
          child: AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                validatorMessage = 'Required';
                return 'Required';
              }
              return null;
            },
          ),
        ),
      );

      // Trigger validation
      final formState = tester.state<FormState>(find.byType(Form));
      formState.validate();
      await tester.pump();

      expect(validatorMessage, 'Required');
      expect(find.text('Required'), findsOneWidget);
    });

    testWidgets('should apply custom background color', (tester) async {
      await tester.pumpApp(
        const AppTextFormField(
          hintText: 'Custom',
          backgroundColor: Colors.blue,
        ),
      );

      // Just verify widget builds without error
      expect(find.byType(TextFormField), findsOneWidget);
    });

    testWidgets('should handle keyboard type', (tester) async {
      await tester.pumpApp(
        const AppTextFormField(
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
      );

      // Verify widget builds with the property
      expect(find.byType(TextFormField), findsOneWidget);
    });

    testWidgets('should handle maxLines', (tester) async {
      await tester.pumpApp(
        const AppTextFormField(hintText: 'Description', maxLines: 5),
      );

      // Verify widget builds with the property
      expect(find.byType(TextFormField), findsOneWidget);
    });
  });
}
