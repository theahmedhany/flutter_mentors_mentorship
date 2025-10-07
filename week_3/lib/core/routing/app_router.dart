import 'package:flutter/material.dart';
import 'package:week_3/features/details/presentation/screens/product_details_screen.dart';
import 'package:week_3/features/home/presentation/screens/main_home_screen.dart';
import 'package:week_3/features/login/presentation/screens/login_screen.dart';
import 'package:week_3/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:week_3/features/products/presentation/screens/products_screen.dart';
import 'package:week_3/features/signup/presentation/screens/signup_screen.dart';

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
      case Routes.mainHomeScreen:
        return MaterialPageRoute(builder: (_) => const MainHomeScreen());

      // Products Screen
      case Routes.productsScreen:
        return MaterialPageRoute(builder: (_) => ProductsScreen());

      // Product Details Screen
      case Routes.productDetailsScreen:
        return MaterialPageRoute(builder: (_) => ProductDetailsScreen());

      default:
        return null;
    }
  }
}
