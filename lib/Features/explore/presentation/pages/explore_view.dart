import 'package:flutter/material.dart';
import '../widgets/custom_container.dart';
import '../widgets/custom_search_field.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';

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
            const CustomTextFieldForSearch(),
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RoutesManager.subjectsDetailRoute);
                    },
                    child: const CustomContainerForSubject(),
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
