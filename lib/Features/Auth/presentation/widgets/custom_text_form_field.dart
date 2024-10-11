import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/theme_manager.dart';
import '../../../../core/resources/values_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.validatorMessage,
    required this.obscureText,
    required this.validator,
  });

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String validatorMessage;
  final bool obscureText;
  final String? Function(String?) validator;

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
        obscureText: obscureText,
        validator: validator);
  }
}
