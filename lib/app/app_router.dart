import 'package:flutter/material.dart';

import '../core/utils/page_transitions.dart';
import '../data/models/car.dart';
import '../features/auth/login_screen.dart';
import '../features/auth/register_screen.dart';
import '../features/details/car_details_screen.dart';
import '../features/favorites/favorites_screen.dart';
import '../features/get_started/get_started_screen.dart';
import '../features/main/main_shell.dart';
import '../features/notifications/notifications_screen.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/profile/profile_screen.dart';
import '../features/settings/settings_screen.dart';
import '../features/splash/splash_screen.dart';
import '../features/wallet/wallet_screen.dart';
import 'app_routes.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return FadePageRoute(child: const SplashScreen(), settings: settings);
      case AppRoutes.onboarding:
        return FadePageRoute(child: const OnboardingScreen(), settings: settings);
      case AppRoutes.getStarted:
        return FadePageRoute(child: const GetStartedScreen(), settings: settings);
      case AppRoutes.login:
        return SlideUpPageRoute(child: const LoginScreen(), settings: settings);
      case AppRoutes.register:
        return SlideUpPageRoute(child: const RegisterScreen(), settings: settings);
      case AppRoutes.main:
        return FadePageRoute(child: const MainShell(), settings: settings);
      case AppRoutes.carDetails:
        final car = settings.arguments as Car;
        return SharedAxisPageRoute(
          child: CarDetailsScreen(car: car),
          settings: settings,
        );
      case AppRoutes.profile:
        return SharedAxisPageRoute(child: const ProfileScreen(), settings: settings);
      case AppRoutes.notifications:
        return SharedAxisPageRoute(
          child: const NotificationsScreen(),
          settings: settings,
        );
      case AppRoutes.favorites:
        return SharedAxisPageRoute(
          child: const FavoritesScreen(showBackButton: true),
          settings: settings,
        );
      case AppRoutes.wallet:
        return SharedAxisPageRoute(
          child: const WalletScreen(showBackButton: true),
          settings: settings,
        );
      case AppRoutes.settings:
        return SharedAxisPageRoute(
          child: const SettingsScreen(showBackButton: true),
          settings: settings,
        );
      default:
        return FadePageRoute(child: const _UnknownRoute(), settings: settings);
    }
  }
}

class _UnknownRoute extends StatelessWidget {
  const _UnknownRoute();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Route not found')));
  }
}
