import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import 'onboarding_description.dart';
import 'onboarding_title.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OnboardingTitle(title: 'Find Your Best\nCompanion With Us'),
        verticalSpace(10),
        OnboardingDescription(
          description:
              'Join & discover the best suitable pets as\nper your preferences in your location',
        ),
      ],
    );
  }
}
