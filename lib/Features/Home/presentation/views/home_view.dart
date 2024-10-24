import 'package:flutter/material.dart';

import '../../../../core/resources/app_constants.dart';
import '../widgets/custom_button_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectIndex = 0; // to show the Explore page by default

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AppConstants.viewOptions[_selectIndex],
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _selectIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
