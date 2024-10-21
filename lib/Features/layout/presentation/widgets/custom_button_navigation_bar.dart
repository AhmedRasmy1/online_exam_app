import 'package:flutter/material.dart';
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
          icon: buildIcon('assets/images/explore_icon.svg', 0, currentIndex),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: buildIcon('assets/images/result_icon.svg', 1, currentIndex),
          label: 'Result',
        ),
        BottomNavigationBarItem(
          icon: buildIcon('assets/images/profile_icon.svg', 2, currentIndex),
          label: 'Profile',
        ),
      ],
      currentIndex: currentIndex,
      onTap: onItemTapped,
      backgroundColor: ColorManager.lightBlue,
      selectedItemColor: ColorManager.blue,
    );
  }
}
