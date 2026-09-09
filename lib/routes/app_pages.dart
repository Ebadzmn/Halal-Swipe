import 'package:flutter/material.dart';
import 'package:halal_swipe/features/auth/login/page/login_page.dart';
import 'package:halal_swipe/features/auth/signup/page/signup_page.dart';
import 'package:halal_swipe/features/auth/verification/verification_processing_screen.dart';
import 'package:halal_swipe/features/auth/verification/verification_success_screen.dart';
import 'package:halal_swipe/features/auth/verification/verify_identity_screen.dart';
import 'package:halal_swipe/features/auth/welcome/welcome_auth_screen.dart';
import 'package:halal_swipe/features/chat/chat_screen.dart';
import 'package:halal_swipe/features/home/page/home_page.dart';
import 'package:halal_swipe/features/matches/match_detail_screen.dart';
import 'package:halal_swipe/features/matches/match_ready_screen.dart';
import 'package:halal_swipe/features/matches/models/match_profile.dart';
import 'package:halal_swipe/features/matches/todays_best_matches_screen.dart';
import 'package:halal_swipe/features/matches/unlock_photo_screen.dart';
import 'package:halal_swipe/features/onboarding/onboarding_screen.dart';
import 'package:halal_swipe/features/preferences/setup_preferences_screen.dart';
import 'package:halal_swipe/features/profile/setup_profile_screen.dart';
import 'package:halal_swipe/features/roadmap/nikah_roadmap_screen.dart';
import 'package:halal_swipe/features/splash/splash_screen.dart';
import 'package:halal_swipe/routes/app_routes.dart';

class AppPages {
  static const String initial = AppRoutes.splash;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.onboarding:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const OnboardingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOutCubicEmphasized,
            );
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: const Interval(0.0, 0.7, curve: Curves.easeIn),
              ),
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.92, end: 1.0)
                    .animate(curvedAnimation),
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 750),
        );
      case AppRoutes.welcomeAuth:
        return MaterialPageRoute(builder: (_) => const WelcomeAuthScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignupPage());
      case AppRoutes.verifyIdentity:
        return MaterialPageRoute(builder: (_) => const VerifyIdentityScreen());
      case AppRoutes.verificationProcessing:
        return MaterialPageRoute(
            builder: (_) => const VerificationProcessingScreen());
      case AppRoutes.verificationSuccess:
        return MaterialPageRoute(
            builder: (_) => const VerificationSuccessScreen());
      case AppRoutes.setupProfile:
        return MaterialPageRoute(builder: (_) => const SetupProfileScreen());
      case AppRoutes.setupPreferences:
        return MaterialPageRoute(
            builder: (_) => const SetupPreferencesScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.matchDetail:
        final profile = (settings.arguments as MatchProfile?) ??
            MatchProfile.sampleMatches.first;
        return MaterialPageRoute(
            builder: (_) => MatchDetailScreen(profile: profile));
      case AppRoutes.todaysBestMatches:
        return MaterialPageRoute(
            builder: (_) => const TodaysBestMatchesScreen());
      case AppRoutes.unlockPhoto:
        final profile = (settings.arguments as MatchProfile?) ??
            MatchProfile.sampleMatches.first;
        return MaterialPageRoute(
            builder: (_) => UnlockPhotoScreen(profile: profile));
      case AppRoutes.matchReady:
        final profile = (settings.arguments as MatchProfile?) ??
            MatchProfile.sampleMatches.first;
        return MaterialPageRoute(
            builder: (_) => MatchReadyScreen(profile: profile));
      case AppRoutes.roadmap:
        return MaterialPageRoute(builder: (_) => const NikahRoadmapScreen());
      case AppRoutes.chat:
        final profile = (settings.arguments as MatchProfile?) ??
            MatchProfile.sampleMatches.first;
        return MaterialPageRoute(
            builder: (_) => ChatScreen(profile: profile));
      default:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
    }
  }
}
