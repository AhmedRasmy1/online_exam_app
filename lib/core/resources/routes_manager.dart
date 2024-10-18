import 'package:flutter/material.dart';
import 'package:online_exam_app/Features/Home/presentation/views/home_page.dart';

import '../../Features/Auth/presentation/views/email_verification_view.dart';
import '../../Features/Auth/presentation/views/forget_password.dart';
import '../../Features/Auth/presentation/views/login_view.dart';
import '../../Features/Auth/presentation/views/reset_password_view.dart';
import '../../Features/Auth/presentation/views/signup_view.dart';
import '../../Features/Auth/presentation/views/splach_view.dart';

class RoutesManager {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String emailVerificationRoute = '/emailVerification';
  static const String resetPasswordRoute = '/resetPassword';
  static const String homeRoute = '/home';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RoutesManager.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RoutesManager.registerRoute:
        return MaterialPageRoute(builder: (_) => const SignUp());
      case RoutesManager.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case RoutesManager.emailVerificationRoute:
        return MaterialPageRoute(builder: (_) => const OtpVerificationPage());
      case RoutesManager.resetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ResetPasswordView());
      case RoutesManager.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("No Route Found"),
              ),
              body: const Center(child: Text("No Route Found")),
            ));
  }
}
