import 'package:flutter/material.dart';
import 'package:online_exam_app/Features/profile/presentation/pages/profile_view.dart';

import '../../Features/explore/presentation/pages/explore_view.dart';
import '../../Features/result/presentation/pages/result_view.dart';




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
