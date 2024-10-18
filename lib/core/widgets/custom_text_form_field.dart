import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/theme_manager.dart';
import '../resources/values_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
    required this.validator,
    this.suffix, // تغيير هنا
    this.keyboardType,
  });

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final String? Function(String?) validator;
  final Widget? suffix;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffix != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  suffix!,
                ],
              )
            : null,
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
          const BorderSide(color: ColorManager.error, width: AppSize.w1_5),
          const BorderRadius.all(Radius.circular(AppSize.s5)),
        ),
        focusedErrorBorder: outLintInputBorderMethod(
          const BorderSide(color: ColorManager.error, width: AppSize.w1_5),
          const BorderRadius.all(Radius.circular(AppSize.s5)),
        ),
      ),
      obscureText: obscureText,
      validator: validator,
    );
  }
}
