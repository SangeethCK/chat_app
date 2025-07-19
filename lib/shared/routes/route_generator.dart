import 'package:chat_app/features/auth/screens/otp_screen.dart';
import 'package:chat_app/features/auth/screens/sign_in_scren.dart';
import 'package:chat_app/features/chat/screen/chat_screen.dart';
import 'package:chat_app/features/home/screen/home_screen.dart';
import 'package:chat_app/features/splash/screen/splash_screen.dart';
import 'package:chat_app/shared/routes/routes.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final Object? args = routeSettings.arguments;

    switch (routeSettings.name) {
      case routeRoot:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case routeSigIn:
        return MaterialPageRoute(builder: (_) => SignInScren());
      case routeOtp:
        return MaterialPageRoute(
          builder: (_) => OtpScreen(),
          settings: RouteSettings(arguments: args),
        );
      case routeHome:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case routeChat:
        return MaterialPageRoute(
          builder: (_) => ChatScreen(),
          settings: RouteSettings(arguments: args),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute({String? error, bool argsError = false}) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error'), centerTitle: true),
        body: Center(
          child: Text(
            error ?? '${argsError ? 'Arguments' : 'Navigation'} Error',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
