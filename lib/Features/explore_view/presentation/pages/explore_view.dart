import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_exam_app/core/resources/assets_manager.dart';
import 'package:online_exam_app/core/resources/color_manager.dart';
import 'package:online_exam_app/core/resources/strings_manager.dart';
import 'package:online_exam_app/core/resources/values_manager.dart';
import 'package:online_exam_app/core/widgets/custom_app_bar.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: AppPadding.p8,
          left: AppPadding.p16,
          right: AppPadding.p16,
        ),
        child: Column(
          children: [
            const CustomAppBar(
              title: AppStrings.quizzy,
              color: ColorManager.blue,
              onTap: null,
            ),
            const SizedBox(height: AppSize.s16),
            TextFormField(
              decoration: InputDecoration(
                hintText: AppStrings.search,
                prefixIcon: SvgPicture.asset(
                  ImageAssets.searchIcon,
                ),
                border: const OutlineInputBorder(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
