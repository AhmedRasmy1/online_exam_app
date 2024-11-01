import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam_app/Features/questions/presentation/view_model/questions_view_model/questions_cubit.dart';
import 'package:online_exam_app/core/functions/extenstions.dart';
import 'package:online_exam_app/core/resources/color_manager.dart';
import 'package:online_exam_app/core/widgets/custom_app_bar.dart';
import 'package:online_exam_app/core/widgets/custom_elevated_button.dart';
import 'package:online_exam_app/di/di.dart';

class QuestionsView extends StatefulWidget {
  const QuestionsView({super.key});

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  Timer? _timer;
  int _remainingTime = 25 * 60; // 30 minutes in seconds
  int? selectedAnswerIndex; // for single choice
  List<bool> selectedAnswers = [
    false,
    false,
    false,
    false
  ]; // for multiple choice
  late QuestionsCubit viewModel;

  void resetSelection() {
    selectedAnswerIndex = null;
    selectedAnswers = [false, false, false, false];
  }

  @override
  void initState() {
    viewModel = getIt.get<QuestionsCubit>();
    viewModel.getQuestionById();
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel();
        onTimerComplete();
      }
    });
  }

  Future<void> onTimerComplete() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/hourglass.svg',
                  height: 100,
                  width: 100,
                ),
                const Text(
                  "Time Out!!",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.error),
                )
              ],
            ),
            actions: [
              CustomElevatedButton(
                buttonColor: ColorManager.blue,
                title: 'View Score.',
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 16.0,
              right: 16.0,
            ),
            child: BlocBuilder<QuestionsCubit, QuestionsState>(
              builder: (context, state) {
                if (state is QuestionsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is QuestionsFail) {
                  return Center(
                    child: Text(state.exception.toString()),
                  );
                } else if (state is QuestionsSuccess) {
                  final questionss = state.questions[viewModel.currentIndex];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomAppBar(
                            title: 'Exam',
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: Image.asset(
                              'assets/images/alarm-64.png',
                            ),
                          ),
                          Text(
                            formatTime(_remainingTime),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: _remainingTime <= (25 * 60) / 2
                                  ? Colors.red
                                  : Colors.green,
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Question ${viewModel.currentIndex + 1} of ${viewModel.questionsList.length}',
                          style: const TextStyle(
                              fontSize: 16,
                              color: ColorManager.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      LinearProgressIndicator(
                        value: (viewModel.currentIndex + 1) /
                            viewModel.questionsList.length,
                        backgroundColor: const Color(0xFFCFCFCF),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            ColorManager.blue),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Text(
                        questionss.question,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children:
                            List.generate(questionss.answers.length, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: questionss.type == 'single_choice'
                                  ? (viewModel.singleChoiceAnswers[
                                              viewModel.currentIndex] ==
                                          index
                                      ? (questionss.answers[index].key ==
                                              questionss.correctAnswer
                                          ? const Color(
                                              0xffcaf9cc) // Correct answer selected
                                          : const Color(
                                              0xfff8d2d2)) // Incorrect answer selected
                                      : (viewModel.singleChoiceAnswers[
                                                      viewModel.currentIndex] !=
                                                  null &&
                                              questionss.answers[index].key ==
                                                  questionss.correctAnswer
                                          ? const Color(
                                              0xffcaf9cc) // Show correct answer if an incorrect one was selected
                                          : const Color(
                                              0xffEDEFF3))) // Default background color
                                  : (viewModel.multiChoiceAnswers[viewModel.currentIndex]
                                          [index]
                                      ? (questionss.answers[index].key ==
                                              questionss.correctAnswer
                                          ? Colors
                                              .green // Correct answer selected in multiple choice
                                          : Colors
                                              .red) // Incorrect answer selected in multiple choice
                                      : (viewModel.multiChoiceAnswers[
                                                      viewModel.currentIndex]
                                                  .contains(true) &&
                                              questionss.answers[index].key ==
                                                  questionss.correctAnswer
                                          ? Colors.green // Show correct answer if incorrect answers are selected
                                          : const Color(0xffEDEFF3))), // Default background color for unselected
                              // Default background color for unselected

                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: questionss.type == 'single_choice'
                                ? RadioListTile<int>(
                                    value: index,
                                    groupValue: viewModel.singleChoiceAnswers[
                                        viewModel.currentIndex],
                                    onChanged: (value) {
                                      setState(() {
                                        viewModel.selectSingleChoiceAnswer(
                                            viewModel.currentIndex, value!);
                                      });
                                    },
                                    title:
                                        Text(questionss.answers[index].answer),
                                    activeColor: const Color(0xff02369C),
                                  )
                                : CheckboxListTile(
                                    value: viewModel.multiChoiceAnswers[
                                        viewModel.currentIndex][index],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        viewModel.selectMultiChoiceAnswer(
                                            viewModel.currentIndex,
                                            index,
                                            value!);
                                      });
                                    },
                                    title:
                                        Text(questionss.answers[index].answer),
                                    activeColor: const Color(0xff02369C),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                  ),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: context.screenWidth / 2.3,
                            child: ElevatedButton(
                              onPressed: () {
                                viewModel.previousQuestion();
                              },
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 17),
                                backgroundColor: ColorManager.white,
                                side:
                                    const BorderSide(color: ColorManager.blue),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              child: const Text(
                                'Back',
                                style: TextStyle(
                                    color: ColorManager.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.screenWidth / 2.3,
                            child: ElevatedButton(
                              onPressed: () {
                                viewModel.nextQuestion();
                              },
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 17),
                                backgroundColor: ColorManager.blue,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              child: const Text(
                                'Next',
                                style: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                } else {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  String formatTime(int second) {
    int minutes = second ~/ 60;
    int seconds = second % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
