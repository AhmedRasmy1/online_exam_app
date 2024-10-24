import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam_app/core/functions/extenstions.dart';
import 'package:online_exam_app/core/resources/color_manager.dart';
import 'package:online_exam_app/core/resources/font_manager.dart';
import 'package:online_exam_app/core/resources/routes_manager.dart';
import 'package:online_exam_app/core/resources/values_manager.dart';
import 'package:online_exam_app/core/widgets/custom_app_bar.dart';

class SubjectDetails extends StatelessWidget {
  const SubjectDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: AppPadding.p8,
            left: AppPadding.p16,
            right: AppPadding.p16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: "Languages",
                onTap: () {
                  Navigator.pop(context);
                },
                color: ColorManager.black,
              ),
              const SizedBox(height: AppSize.s40),
              Text(
                "English",
                style: TextStyle(
                  fontSize: FontSize.s18,
                  color: ColorManager.black,
                  fontWeight: FontWeightManager.medium,
                ),
              ),
              const SizedBox(height: AppSize.s10),
              Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RoutesManager.examPreviewRoute);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: AppMargin.m16),
                          padding: const EdgeInsets.symmetric(
                            vertical: AppPadding.p16,
                            horizontal: AppPadding.p16,
                          ),
                          width: context.screenWidth,
                          height: context.screenHeight / 7,
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
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/images/multiple-choice.svg",
                                height: context.screenHeight / 9,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "High Level",
                                          style: TextStyle(
                                            fontSize: FontSize.s16,
                                            color: ColorManager.black,
                                            fontWeight:
                                                FontWeightManager.medium,
                                          ),
                                        ),
                                        Text(
                                          '30 Minutes',
                                          style: TextStyle(
                                            fontSize: FontSize.s14,
                                            color: ColorManager.blue,
                                            fontWeight:
                                                FontWeightManager.regular,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: AppSize.s5),
                                    Text(
                                      "20 Question",
                                      style: TextStyle(
                                        fontSize: FontSize.s14,
                                        color: ColorManager.grey,
                                        fontWeight: FontWeightManager.regular,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "From: 1.00   To: 6.00",
                                      style: TextStyle(
                                        fontSize: FontSize.s14,
                                        color: ColorManager.black,
                                        fontWeight: FontWeightManager.bold,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
