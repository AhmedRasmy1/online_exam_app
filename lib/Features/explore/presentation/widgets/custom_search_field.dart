import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam_app/core/resources/assets_manager.dart';
import 'package:online_exam_app/core/resources/color_manager.dart';
import 'package:online_exam_app/core/resources/font_manager.dart';
import 'package:online_exam_app/core/resources/strings_manager.dart';
import 'package:online_exam_app/core/resources/values_manager.dart';

class CustomTextFieldForSearch extends StatelessWidget {
  const CustomTextFieldForSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: AppStrings.search,
        hintStyle: TextStyle(
          fontSize: FontSize.s14,
          color: ColorManager.grey,
          fontWeight: FontWeightManager.medium,
        ),
        prefixIcon: SizedBox(
          width: AppSize.s18,
          height: AppSize.s18,
          child: SvgPicture.asset(
            ImageAssets.searchIcon,
            fit: BoxFit.scaleDown,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
      ),
    );
  }
}
