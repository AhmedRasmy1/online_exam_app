import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_molde/exams_view_model.dart/exams_cubit.dart';
import '../../../../di/di.dart';
import '../../domain/entities/subjects_entity.dart';
import '../../../../core/functions/extenstions.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class SubjectDetails extends StatefulWidget {
  const SubjectDetails({super.key});

  @override
  State<SubjectDetails> createState() => _SubjectDetailsState();
}

class _SubjectDetailsState extends State<SubjectDetails> {
  late ExamsCubit viewModel;

  @override
  void initState() {
    viewModel = getIt<ExamsCubit>();
    viewModel.getExamById();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SubjectEntity subject =
        ModalRoute.of(context)!.settings.arguments as SubjectEntity;

    return BlocProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: AppPadding.p8,
              left: AppPadding.p16,
              right: AppPadding.p16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  title: subject.name,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  color: ColorManager.black,
                ),
                const SizedBox(height: AppSize.s32),
                BlocBuilder<ExamsCubit, ExamsState>(
                  builder: (context, state) {
                    if (state is ExamsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ExamsFail) {
                      return Center(
                        child: Text(state.exception.toString()),
                      );
                    } else if (state is ExamsSuccess) {
                      var data = state.exams;
                      if (data.isEmpty) {
                        //todo: add image
                        return Padding(
                          padding: const EdgeInsets.only(top: 110),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/mega-creator.png",
                                  width: context.screenWidth / 1,
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final exams = data[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RoutesManager.examPreviewRoute,
                                  arguments: {
                                    'subject': subject,
                                    'exam': exams,
                                  });
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
                                borderRadius:
                                    BorderRadius.circular(AppSize.s20),
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
                                  Image.network(
                                    subject.icon,
                                    width: 70,
                                    height: 70,
                                  ),
                                  const SizedBox(width: AppSize.s16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              exams.title,
                                              style: TextStyle(
                                                fontSize: FontSize.s16,
                                                color: ColorManager.black,
                                                fontWeight:
                                                    FontWeightManager.medium,
                                              ),
                                            ),
                                            Text(
                                              '${exams.duration} Minutes',
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
                                          "${exams.numberOfQuestions} Question",
                                          style: TextStyle(
                                            fontSize: FontSize.s14,
                                            color: ColorManager.grey,
                                            fontWeight:
                                                FontWeightManager.regular,
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
                        },
                      );
                    } else {
                      return const Center(
                        child: Text('No Data'),
                      );
                    }
                  },
                ),
                const SizedBox(height: AppSize.s48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
