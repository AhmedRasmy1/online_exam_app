import 'package:flutter/material.dart';
import 'package:online_exam_app/Features/explore/presentation/pages/exam_preview.dart';
import 'package:online_exam_app/Features/explore/presentation/pages/subject_details.dart';
import 'package:online_exam_app/Features/profile/presentation/pages/change_password_view.dart';
import '../../Features/Home/presentation/views/home_view.dart';

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
  static const String changePasswordRoute = '/changePassword';
  static const String subjectsDetailRoute = '/subjectsDetail';
  static const String examPreviewRoute = '/examPreview';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
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
      case RoutesManager.changePasswordRoute:
        return MaterialPageRoute(builder: (_) => const ChangePasswordView());
      case RoutesManager.subjectsDetailRoute:
        return MaterialPageRoute(builder: (_) => const SubjectDetails());
      case RoutesManager.examPreviewRoute:
        return MaterialPageRoute(builder: (_) => const ExamPreview());
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
