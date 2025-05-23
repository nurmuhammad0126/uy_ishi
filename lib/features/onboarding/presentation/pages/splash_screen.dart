import 'package:ecommer_app_market/core/extension/context_extensions.dart';
import 'package:ecommer_app_market/core/routes/app_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((_) {
      if (mounted) {
        context.go(AppNames.onBoading);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Kutuku",
              style: context.styles.s30w800.copyWith(
                color: context.colors.white,
                fontSize: 40.0,
              ),
            ),
            Text(
              "Any shoping, just from home",
              style: context.styles.s20w400.copyWith(
                color: context.colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
