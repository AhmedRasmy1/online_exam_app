import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/resources/color_manager.dart';
import 'core/resources/routes_manager.dart';
import 'core/resources/theme_manager.dart';
import 'core/utils/cash_data.dart';
import 'core/utils/my_block_observer.dart';
import 'di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //! what is this?
  configureDependencies();
  SharedData.cacheInitialization();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);
  runApp(const OnlineExam());
}

class OnlineExam extends StatelessWidget {
  const OnlineExam({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: ColorManager.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: RoutesManager.splashRoute,
      ),
    );
  }
}
// test