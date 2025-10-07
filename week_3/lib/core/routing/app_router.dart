import 'package:flutter/material.dart';
import 'package:week_3/features/brands/presentation/screens/brands_screen.dart';
import 'package:week_3/features/details/presentation/screens/product_details_screen.dart';
import 'package:week_3/features/home/presentation/screens/main_home_screen.dart';
import 'package:week_3/features/login/presentation/screens/login_screen.dart';
import 'package:week_3/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:week_3/features/products/presentation/screens/products_screen.dart';
import 'package:week_3/features/signup/presentation/screens/signup_screen.dart';
import 'package:week_3/features/verify_email/presentation/screens/otp_screen.dart';
import 'package:week_3/features/verify_email/presentation/screens/verify_email_screen.dart';

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

      // Verify Email Screen
      case Routes.verifyEmailScreen:
        return MaterialPageRoute(builder: (_) => const VerifyEmailScreen());

      // OTP Screen
      case Routes.otpScreen:
        return MaterialPageRoute(builder: (_) => const OtpScreen());

      // Home Screen
      case Routes.mainHomeScreen:
        return MaterialPageRoute(builder: (_) => const MainHomeScreen());

      // Products Screen
      case Routes.productsScreen:
        return MaterialPageRoute(builder: (_) => ProductsScreen());

      // Brands Screen
      case Routes.brandsScreen:
        return MaterialPageRoute(builder: (_) => const BrandsScreen());

      // Product Details Screen
      case Routes.productDetailsScreen:
        return MaterialPageRoute(builder: (_) => const ProductDetailsScreen());

      default:
        return null;
    }
  }
}
