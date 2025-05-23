import 'package:ecommer_app_market/features/auth/presentation/pages/register_screen.dart';
import 'package:ecommer_app_market/features/home/presentation/pages/home_screen.dart';
import 'package:ecommer_app_market/features/onboarding/presentation/pages/on_boarding_screen.dart';
import 'package:ecommer_app_market/features/onboarding/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_names.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: AppNames.spalsh,
    routes: [
      GoRoute(
        path: AppNames.spalsh,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppNames.onBoading,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: AppNames.login,
        builder: (context, state) => const PlaceholderScreen(title: "login"),
      ),
      GoRoute(
        path: AppNames.forgetPasword,
        builder:
            (context, state) => const PlaceholderScreen(title: "forgetPasword"),
      ),
      GoRoute(
        path: AppNames.verification,
        builder:
            (context, state) => const PlaceholderScreen(title: "verification"),
      ),
      GoRoute(
        path: AppNames.register,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: AppNames.access,
        builder: (context, state) => const PlaceholderScreen(title: 'Access'),
      ),
      GoRoute(
        path: AppNames.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppNames.cart,
        builder: (context, state) => const PlaceholderScreen(title: 'Cart'),
      ),
      GoRoute(
        path: AppNames.editCart,
        builder:
            (context, state) => const PlaceholderScreen(title: 'Edit Cart'),
      ),
      GoRoute(
        path: AppNames.payment,
        builder: (context, state) => const PlaceholderScreen(title: 'Payment'),
      ),
      GoRoute(
        path: AppNames.map,
        builder: (context, state) => const PlaceholderScreen(title: 'Map'),
      ),
      GoRoute(
        path: AppNames.chat,
        builder: (context, state) => const PlaceholderScreen(title: 'Chat'),
      ),
    ],
  );
}

class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title, style: const TextStyle(fontSize: 24))),
    );
  }
}
