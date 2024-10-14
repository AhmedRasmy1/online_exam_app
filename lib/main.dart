import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/resources/routes_manager.dart';
import 'core/resources/theme_manager.dart';
import 'core/utils/cash_data.dart';
import 'core/utils/my_block_observer.dart';
import 'di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  SharedData.cacheInitialization();
  Bloc.observer = MyBlocObserver();
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
