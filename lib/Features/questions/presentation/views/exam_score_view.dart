import 'package:flutter/material.dart';
import 'package:online_exam_app/core/widgets/custom_elevated_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:online_exam_app/core/resources/color_manager.dart';
import 'package:online_exam_app/core/resources/routes_manager.dart';
import 'package:online_exam_app/core/widgets/custom_app_bar.dart';

class ExamScoreView extends StatelessWidget {
  const ExamScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> results =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int correctAnswers = results['correct'];
    final int incorrectAnswers = results['wrong'];
    final int totalAnswers = correctAnswers + incorrectAnswers;
    final double percentage =
        (totalAnswers > 0) ? (correctAnswers / totalAnswers) * 100 : 0;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: 'Exam Score',
                onTap: () {
                  Navigator.pushNamed(context, RoutesManager.homeRoute);
                },
              ),
              const SizedBox(height: 40),
              const Text("Your score",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircularPercentIndicator(
                    radius: 70.0,
                    animation: true,
                    animationDuration: 1000,
                    lineWidth: 10.0,
                    percent: percentage / 100,
                    center: Text(
                      '${percentage.toStringAsFixed(0)}%',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    progressColor: ColorManager.blue,
                    backgroundColor: ColorManager.error,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Correct',
                              style: TextStyle(
                                  color: ColorManager.blue, fontSize: 18),
                            ),
                            CircleAvatar(
                              radius: 14,
                              backgroundColor:
                                  ColorManager.blue.withOpacity(0.1),
                              child: Text(
                                correctAnswers.toString(),
                                style: const TextStyle(
                                    color: ColorManager.blue, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Incorrect',
                                    style: TextStyle(
                                        color: ColorManager.error,
                                        fontSize: 18),
                                  ),
                                  CircleAvatar(
                                    radius: 14,
                                    backgroundColor:
                                        ColorManager.error.withOpacity(0.1),
                                    child: Text(
                                      incorrectAnswers.toString(),
                                      style: const TextStyle(
                                          color: ColorManager.error,
                                          fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),
              CustomElevatedButton(
                buttonColor: ColorManager.blue,
                title: 'Show Result',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 24),
              CustomElevatedButton(
                buttonColor: ColorManager.white,
                textColor: ColorManager.blue,
                title: 'Start Again',
                onPressed: () {
                  Navigator.pushNamed(context, RoutesManager.questionsRoute);
                },
                side: const BorderSide(color: ColorManager.blue),
              )
            ],
          ),
        ),
      ),
    );
  }
}
