import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam_app/core/resources/color_manager.dart';
import 'package:online_exam_app/core/resources/font_manager.dart';
import 'package:online_exam_app/core/resources/values_manager.dart';
import 'package:online_exam_app/core/widgets/custom_app_bar.dart';
import 'package:online_exam_app/core/widgets/custom_elevated_button.dart';

class ExamPreview extends StatelessWidget {
  const ExamPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppPadding.p8,
            left: AppPadding.p16,
            right: AppPadding.p16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: AppSize.s24),
              Row(
                children: [
                  SvgPicture.asset('assets/images/test.svg'),
                  const SizedBox(width: AppSize.s8),
                  Text(
                    'Languages',
                    style: TextStyle(
                      fontSize: FontSize.s22,
                      color: ColorManager.black,
                      fontWeight: FontWeightManager.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '30 Minutes',
                    style: TextStyle(
                      fontSize: FontSize.s16,
                      color: ColorManager.blue,
                      fontWeight: FontWeightManager.regular,
                    ),
                  )
                ],
              ),
              const SizedBox(height: AppSize.s8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "High Level",
                    style: TextStyle(
                      fontSize: FontSize.s18,
                      color: ColorManager.black,
                      fontWeight: FontWeightManager.medium,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                    child: VerticalDivider(
                      color: Color(0xff809ACD),
                      thickness: 1,
                      width: 20,
                    ),
                  ),
                  Text(
                    "20 Question",
                    style: TextStyle(
                      fontSize: FontSize.s16,
                      color: ColorManager.grey,
                      fontWeight: FontWeightManager.medium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s16),
              const Divider(color: Color(0xffCCD7EB), thickness: 1),
              const SizedBox(height: AppSize.s24),
              Text(
                "Instructions",
                style: TextStyle(
                  fontSize: FontSize.s18,
                  color: ColorManager.black,
                  fontWeight: FontWeightManager.medium,
                ),
              ),
              const SizedBox(height: AppSize.s16),
              // هنا قمنا بإزالة الـ Expanded
              ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    dense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    horizontalTitleGap: -10,
                    leading: Text(
                      "•",
                      style: TextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.grey,
                        fontWeight: FontWeightManager.bold,
                      ),
                    ),
                    title: Text(
                      "Lorem ipsum dolor sit amet consectetur.",
                      style: TextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.grey,
                        fontWeight: FontWeightManager.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  );
                },
              ),
              const SizedBox(height: AppSize.s48),
              CustomElevatedButton(
                buttonColor: ColorManager.blue,
                title: 'Start Exam',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
