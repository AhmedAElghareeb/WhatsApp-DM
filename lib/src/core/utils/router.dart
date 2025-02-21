
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_messaging/src/core/utils/routes.dart';
import 'package:whatsapp_messaging/src/presentations/home/cubit/home_cubit.dart';
import 'package:whatsapp_messaging/src/presentations/home/home_page.dart';
import 'package:whatsapp_messaging/src/presentations/splash/cubit/splash_cubit.dart';
import 'package:whatsapp_messaging/src/presentations/splash/splash_page.dart';

abstract class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case AppRoutes.splashPage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SplashCubit()..initializeSplash(),
            child: const SplashPage(),
          ),
          settings: settings,
        );
      case AppRoutes.homePage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit(),
            child: const HomePage(),
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Unknown Route'),
            ),
          ),
          settings: settings,
        );
    }
  }

  static List<Route<dynamic>> generateInitialRoutes(String initialRoute) {
    if (initialRoute == AppRoutes.splashPage) {
      return [
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SplashCubit()..initializeSplash(),
            child: const SplashPage(),
          ),
          settings: RouteSettings(name: initialRoute),
        ),
      ];
    } else if (initialRoute == AppRoutes.homePage) {
      return [
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit(),
            child: const HomePage(),
          ),
          settings: RouteSettings(name: initialRoute),
        ),
      ];
    } else {
      return Navigator.defaultGenerateInitialRoutes(
        NavigatorState(),
        initialRoute,
      );
    }
  }
}
