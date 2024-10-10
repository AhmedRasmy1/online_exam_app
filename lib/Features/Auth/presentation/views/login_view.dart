import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_exam_app/core/resources/color_manager.dart';
import 'package:online_exam_app/core/resources/font_manager.dart';
import 'package:online_exam_app/core/resources/styles_manager.dart';
import 'package:online_exam_app/core/resources/theme_manager.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
              top: AppPadding.p8, left: AppPadding.p16, right: AppPadding.p16),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/images/Vector.svg"),
                  const SizedBox(width: AppSize.s8),
                  Text(
                    AppStrings.login,
                    style: TextStyle(
                      fontSize: FontSize.s20,
                      color: ColorManager.black,
                      fontWeight: FontWeightManager.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(height: AppSize.s24),
              TextFormField(
                decoration: InputDecoration(
                  labelText: AppStrings.email,
                  labelStyle: getRegularStyle(
                    color: ColorManager.grey,
                    fontSize: FontSize.s16,
                  ),
                  hintText: AppStrings.enterYourEmail,
                  hintStyle: getRegularStyle(
                    color: ColorManager.placeHolderColor,
                    fontSize: FontSize.s14,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: const EdgeInsets.all(AppPadding.p18),
                  enabledBorder: outLintInputBorderMethod(
                    const BorderSide(
                        color: ColorManager.black, width: AppSize.w1_5),
                    const BorderRadius.all(Radius.circular(AppSize.s5)),
                  ),
                  focusedBorder: outLintInputBorderMethod(
                    const BorderSide(
                        color: ColorManager.grey, width: AppSize.w1_5),
                    const BorderRadius.all(Radius.circular(AppSize.s5)),
                  ),
                  errorBorder: outLintInputBorderMethod(
                    const BorderSide(
                        color: ColorManager.red, width: AppSize.w1_5),
                    const BorderRadius.all(Radius.circular(AppSize.s5)),
                  ),
                  focusedErrorBorder: outLintInputBorderMethod(
                    const BorderSide(
                        color: ColorManager.red, width: AppSize.w1_5),
                    const BorderRadius.all(Radius.circular(AppSize.s5)),
                  ),
                ),
              ),
              const SizedBox(height: AppSize.s24),
              TextFormField(
                decoration: InputDecoration(
                  labelText: AppStrings.password,
                  labelStyle: getRegularStyle(
                    color: ColorManager.grey,
                    fontSize: FontSize.s16,
                  ),
                  hintText: AppStrings.enterYourPassword,
                  hintStyle: getRegularStyle(
                    color: ColorManager.placeHolderColor,
                    fontSize: FontSize.s14,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: const EdgeInsets.all(AppPadding.p18),
                  enabledBorder: outLintInputBorderMethod(
                    const BorderSide(
                        color: ColorManager.black, width: AppSize.w1_5),
                    const BorderRadius.all(Radius.circular(AppSize.s5)),
                  ),
                  focusedBorder: outLintInputBorderMethod(
                    const BorderSide(
                        color: ColorManager.grey, width: AppSize.w1_5),
                    const BorderRadius.all(Radius.circular(AppSize.s5)),
                  ),
                  errorBorder: outLintInputBorderMethod(
                    const BorderSide(
                        color: ColorManager.red, width: AppSize.w1_5),
                    const BorderRadius.all(Radius.circular(AppSize.s5)),
                  ),
                  focusedErrorBorder: outLintInputBorderMethod(
                    const BorderSide(
                        color: ColorManager.red, width: AppSize.w1_5),
                    const BorderRadius.all(Radius.circular(AppSize.s5)),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  const Text(
                    AppStrings.rememberMe,
                    style: TextStyle(
                        fontSize: FontSize.s14, color: ColorManager.black),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.forgetPassword,
                      style: TextStyle(
                          fontSize: FontSize.s14,
                          color: ColorManager.black,
                          fontWeight: FontWeightManager.regular),
                    ),
                  )
                ],
              ),
              const SizedBox(height: AppSize.s48),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.blue,
                  minimumSize: const Size(double.infinity, AppSize.s48),
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppSize.s24)),
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppStrings.dontHaveAccount,
                    style: TextStyle(
                        fontSize: FontSize.s16, color: ColorManager.black),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.signUp,
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: ColorManager.blue,
                          fontSize: FontSize.s16,
                          color: ColorManager.blue,
                          fontWeight: FontWeightManager.semiBold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
