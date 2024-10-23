import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_exam_app/core/functions/extenstions.dart';
import 'package:online_exam_app/core/resources/assets_manager.dart';
import 'package:online_exam_app/core/resources/color_manager.dart';
import 'package:online_exam_app/core/resources/font_manager.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            ),
            const SizedBox(height: AppSize.s40),
            Text(
              AppStrings.browseBySubject,
              style: TextStyle(
                fontSize: FontSize.s18,
                color: ColorManager.black,
                fontWeight: FontWeightManager.medium,
              ),
            ),
            const SizedBox(height: AppSize.s24),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
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
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
