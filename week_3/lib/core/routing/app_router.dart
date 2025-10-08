import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week_3/core/di/dependency_injection.dart';
import 'package:week_3/features/brands/data/repos/brands_repo.dart';
import 'package:week_3/features/brands/presentation/logic/brands_cubit.dart';
import 'package:week_3/features/brands/presentation/screens/brands_screen.dart';
import 'package:week_3/features/details/data/repos/product_details_repo.dart';
import 'package:week_3/features/details/presentation/logic/product_details_cubit.dart';
import 'package:week_3/features/details/presentation/screens/product_details_screen.dart';
import 'package:week_3/features/home/presentation/screens/main_home_screen.dart';
import 'package:week_3/features/login/presentation/logic/login_cubit.dart';
import 'package:week_3/features/login/presentation/screens/login_screen.dart';
import 'package:week_3/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:week_3/features/products/data/repos/products_repo.dart';
import 'package:week_3/features/products/presentation/logic/products_cubit.dart';
import 'package:week_3/features/products/presentation/screens/products_screen.dart';
import 'package:week_3/features/profile/data/repos/user_profile_repo.dart';
import 'package:week_3/features/profile/presentation/logic/user_profile_cubit.dart';
import 'package:week_3/features/signup/presentation/logic/signup_cubit.dart';
import 'package:week_3/features/signup/presentation/screens/signup_screen.dart';
import 'package:week_3/features/verify_email/presentation/logic/resend_otp/resend_otp_cubit.dart';
import 'package:week_3/features/verify_email/presentation/logic/verify_otp/verify_otp_cubit.dart';
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
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      // Sign Up Screen
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignUpScreen(),
          ),
        );

      // Verify Email Screen
      case Routes.verifyEmailScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ResendOtpCubit>(),
            child: const VerifyEmailScreen(),
          ),
        );

      // OTP Screen
      case Routes.otpScreen:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VerifyOtpCubit>(),
            child: OtpScreen(email: email),
          ),
        );

      // Home Screen
      case Routes.mainHomeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    BrandsCubit(getIt<BrandsRepo>())..emitGetAllBrands(),
              ),

              BlocProvider(
                create: (context) =>
                    UserProfileCubit(getIt<UserProfileRepo>())
                      ..emitGetUserProfile(),
              ),

              BlocProvider(
                create: (context) =>
                    ProductsCubit(getIt<ProductsRepo>())..emitGetAllProducts(),
              ),
            ],
            child: const MainHomeScreen(),
          ),
        );

      // Products Screen
      case Routes.productsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                ProductsCubit(getIt<ProductsRepo>())..emitGetAllProducts(),
            child: ProductsScreen(),
          ),
        );

      // Brands Screen
      case Routes.brandsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                BrandsCubit(getIt<BrandsRepo>())..emitGetAllBrands(),
            child: BrandsScreen(),
          ),
        );

      // Product Details Screen
      case Routes.productDetailsScreen:
        final productId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                ProductDetailsCubit(getIt<ProductDetailsRepo>())
                  ..emitGetProductDetails(productId),
            child: ProductDetailsScreen(productId: productId),
          ),
        );

      default:
        return null;
    }
  }
}
