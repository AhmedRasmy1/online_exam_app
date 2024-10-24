import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam_app/core/functions/extenstions.dart';
import 'package:online_exam_app/core/resources/assets_manager.dart';
import 'package:online_exam_app/core/resources/color_manager.dart';
import 'package:online_exam_app/core/resources/font_manager.dart';
import 'package:online_exam_app/core/resources/strings_manager.dart';
import 'package:online_exam_app/core/resources/values_manager.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppMargin.m16),
      width: context.screenWidth,
      height: context.screenHeight / 9.4,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(AppSize.s20),
        boxShadow: [
          BoxShadow(
            color: ColorManager.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: AppPadding.p24),
        child: Row(
          children: [
            SvgPicture.asset(
              ImageAssets.languageTranslator,
              height: AppSize.s54,
              width: AppSize.s54,
            ),
            const SizedBox(width: AppSize.s8),
            Text(
              AppStrings.language,
              style: TextStyle(
                fontSize: FontSize.s16,
                color: ColorManager.black,
                fontWeight: FontWeightManager.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
