import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/cash_data.dart';

import '../../../../core/resources/app_constants.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    movedToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.blue,
      body: Center(
        child: Image.asset(ImageAssets.splashLogo),
      ),
    );
  }

  void movedToNextPage() {

    Future.delayed(
      const Duration(seconds: AppConstants.splachDelay),
      () {

        Navigator.pushNamedAndRemoveUntil(
            // ignore: use_build_context_synchronously
            context,
            GetDataCache.isActive?RoutesManager.layoutRoute:RoutesManager.loginRoute,
            (route) => false);
      },
    );
  }
}
