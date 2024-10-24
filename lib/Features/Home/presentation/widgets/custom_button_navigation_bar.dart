import 'package:flutter/material.dart';
import 'package:online_exam_app/core/resources/assets_manager.dart';
import 'package:online_exam_app/core/resources/strings_manager.dart';
import '../../../../core/functions/form_helpers.dart';
import '../../../../core/resources/color_manager.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });
  final int currentIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: buildIcon(ImageAssets.exploreIcon, 0, currentIndex),
          label: AppStrings.explore,
        ),
        BottomNavigationBarItem(
          icon: buildIcon(ImageAssets.resultIcon, 1, currentIndex),
          label: AppStrings.result,
        ),
        BottomNavigationBarItem(
          icon: buildIcon(ImageAssets.profileIcon, 2, currentIndex),
          label: AppStrings.profile,
        ),
      ],
      currentIndex: currentIndex,
      onTap: onItemTapped,
      backgroundColor: ColorManager.lightBlue,
      selectedItemColor: ColorManager.blue,
    );
  }
}
