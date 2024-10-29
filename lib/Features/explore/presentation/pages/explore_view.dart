import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/Features/explore/presentation/view_molde/subjects_view_model/subjects_cubit.dart';
import 'package:online_exam_app/di/di.dart';
import '../widgets/custom_container.dart';
import '../widgets/custom_search_field.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  late SubjectsCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<SubjectsCubit>();
    viewModel.getAllSubjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p16, vertical: AppPadding.p8),
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
              BlocBuilder<SubjectsCubit, SubjectsState>(
                builder: (context, state) {
                  if (state is SubjectsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SubjectsFail) {
                    return Center(
                      child: Text(state.exception.toString()),
                    );
                  } else if (state is SubjectsSuccess) {
                    var data = state.subjects;
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        var subjects = data[index];
                        return GestureDetector(
                          onTap: () {
                            var subjects = data[index];
                            Navigator.pushNamed(
                              context,
                              RoutesManager.subjectsDetailRoute,
                              arguments: subjects,
                            );
                          },
                          child: CustomContainerForSubject(
                            iconUrl: subjects!.icon,
                            title: subjects.name,
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
            ],
          ),
        ),
      ),
    );
  }
}
