import 'package:flutter/material.dart';
import 'package:halal_swipe/features/auth/login/page/login_page.dart';
import 'package:halal_swipe/features/auth/signup/page/signup_page.dart';
import 'package:halal_swipe/features/auth/welcome/welcome_auth_screen.dart';
import 'package:halal_swipe/features/home/page/home_page.dart';
import 'package:halal_swipe/features/onboarding/onboarding_screen.dart';
import 'package:halal_swipe/routes/app_routes.dart';

class AppPages {
  static const String initial = AppRoutes.onboarding;

  static Map<String, WidgetBuilder> get routes => {
        AppRoutes.onboarding: (context) => const OnboardingScreen(),
        AppRoutes.welcomeAuth: (context) => const WelcomeAuthScreen(),
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.signup: (context) => const SignupPage(),
        AppRoutes.home: (context) => const HomePage(),
      };
}
