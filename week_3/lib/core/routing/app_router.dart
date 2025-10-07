import 'package:flutter/material.dart';
import 'package:week_3/features/login/presentation/screens/login_screen.dart';
import 'package:week_3/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:week_3/features/signup/presentation/screens/signup_screen.dart';

import '../../features/home/presentation/screens/home_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Onboarding Screen
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      // Login Screen
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      // Sign Up Screen
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      // Home Screen
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return null;
    }
  }
}
