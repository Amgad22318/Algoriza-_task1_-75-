import 'package:flutter/material.dart';
import 'package:task1/constants/screens.dart' as screens;
import 'package:task1/constants/shared_preferences_keys.dart';
import 'package:task1/data/data_provider/local/cache_helper.dart';
import 'package:task1/presentation/screens/login_screen.dart';
import 'package:task1/presentation/screens/onboarding_screen.dart';
import 'package:task1/presentation/screens/register_screen.dart';

class AppRouter {
  late Widget startScreen;

  AppRouter() {
    // CacheHelper.clearSPData();
    bool? onBoardingSeen =
        CacheHelper.getDataFromSP(key: SharedPreferencesKeys.onBoardingSeen);
    if (onBoardingSeen == true) {
      startScreen = const LoginScreen();
    } else {
      startScreen = const OnBoardingScreen();
    }
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.loginScreenRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case screens.registerScreenRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      default:
        return null;
    }
  }
}
