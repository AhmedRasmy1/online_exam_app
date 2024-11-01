import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/cash_data.dart';
import '../../Features/explore/presentation/pages/explore_view.dart';
import '../../Features/profile/presentation/pages/profile_view.dart';
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

  static const List<String> examRules = [
    "Read all questions carefully.",
    "Manage your time effectively.",
    "Do not use any external resources.",
    "Review your answers before submitting."
  ];
  static bool isActive =
      SharedData.getData(key: StringCache.isActiveRemember) ?? false;
}
