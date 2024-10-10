import 'package:flutter/material.dart';
import 'package:online_exam_app/core/resources/color_manager.dart';
import 'package:online_exam_app/core/resources/font_manager.dart';
import 'package:online_exam_app/core/resources/strings_manager.dart';
import 'package:online_exam_app/core/resources/values_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.buttonColor,
    required this.title,
    required this.onPressed,
  });

  final Color buttonColor;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: const Size(double.infinity, AppSize.s48),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s24)),
        ),
      ),
      child: Text(
        AppStrings.login,
        style: TextStyle(
          color: ColorManager.white,
          fontSize: FontSize.s16,
          fontWeight: FontWeightManager.medium,
        ),
      ),
    );
  }
}
