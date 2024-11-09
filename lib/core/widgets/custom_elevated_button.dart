// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/values_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.buttonColor,
    required this.title,
    required this.onPressed,
    this.textColor = ColorManager.white,
    this.side,
  });

  final Color buttonColor;
  final String title;
  final void Function() onPressed;
  final Color? textColor;
  final BorderSide? side;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          minimumSize: const Size(double.infinity, AppSize.s48),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s24)),
          ),
          side: side),
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: FontSize.s16,
          fontWeight: FontWeightManager.medium,
        ),
      ),
    );
  }
}
