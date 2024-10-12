import 'package:flutter/material.dart';

import 'core/resources/routes_manager.dart';
import 'core/resources/theme_manager.dart';
import 'di/di.dart';

void main() {
  configureDependencies();
  runApp(const OnlineExam());
}

class OnlineExam extends StatelessWidget {
  const OnlineExam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: RoutesManager.splashRoute,
    );
  }
}
