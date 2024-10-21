import 'package:flutter/material.dart';
import '../../Features/explore_view/presentation/pages/explore_view.dart';
import '../../Features/profile/presentation/pages/profile_view.dart';
import '../../Features/result_view/presentation/pages/result_view.dart';

class AppConstants {
  static const int splachDelay = 3;
  static const double screenWidthRatio = 2.3;
  static const int listGenerate = 6;
  static const viewOptions = <Widget>[
    ExploreView(),
    ResultView(),
    ProfileView(),
  ];
}
