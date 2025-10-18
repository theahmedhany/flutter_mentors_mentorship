import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../widgets/get_started_button.dart';
import '../widgets/onboarding_content.dart';
import '../widgets/pet_image.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              verticalSpace(64),
              const PetImageWidget(),
              verticalSpace(69),
              const OnboardingContent(),
              verticalSpace(61),
              GetStartedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.homeScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
