import 'package:flutter/material.dart';

import 'package:online_exam_app/core/resources/color_manager.dart';
import 'package:online_exam_app/core/resources/font_manager.dart';
import 'package:online_exam_app/core/resources/styles_manager.dart';
import 'package:online_exam_app/core/resources/theme_manager.dart';
import 'package:online_exam_app/core/resources/values_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.validatorMessage,
  });

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String validatorMessage;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: getRegularStyle(
          color: ColorManager.grey,
          fontSize: FontSize.s16,
        ),
        hintText: hintText,
        hintStyle: getRegularStyle(
          color: ColorManager.placeHolderColor,
          fontSize: FontSize.s14,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.all(AppPadding.p18),
        enabledBorder: outLintInputBorderMethod(
          const BorderSide(color: ColorManager.black, width: AppSize.w1_5),
          const BorderRadius.all(Radius.circular(AppSize.s5)),
        ),
        focusedBorder: outLintInputBorderMethod(
          const BorderSide(color: ColorManager.grey, width: AppSize.w1_5),
          const BorderRadius.all(Radius.circular(AppSize.s5)),
        ),
        errorBorder: outLintInputBorderMethod(
          const BorderSide(color: ColorManager.red, width: AppSize.w1_5),
          const BorderRadius.all(Radius.circular(AppSize.s5)),
        ),
        focusedErrorBorder: outLintInputBorderMethod(
          const BorderSide(color: ColorManager.red, width: AppSize.w1_5),
          const BorderRadius.all(Radius.circular(AppSize.s5)),
        ),
      ),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorMessage;
        }
        return null;
      },
    );
  }
}
