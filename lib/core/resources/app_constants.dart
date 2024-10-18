import 'package:flutter/material.dart';
import '../../Features/Home/presentation/views/explore_view.dart';
import '../../Features/Home/presentation/views/profile_view.dart';
import '../../Features/Home/presentation/views/result_view.dart';

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
