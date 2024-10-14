import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/cash_data.dart';

import '../../../../core/functions/form_helpers.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/Uitls.dart';
import '../../../../di/di.dart';
import '../view_model/forgot_view_model.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  late ForgotPasswordViewModel viewModel;
  final TextEditingController _emailController = TextEditingController();
  Color buttonColor = ColorManager.blue;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    viewModel = getIt.get<ForgotPasswordViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
                top: AppPadding.p8,
                left: AppPadding.p16,
                right: AppPadding.p16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomAppBar(
                    title: AppStrings.password,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: AppSize.s40),
                  Text(
                    AppStrings.titleOfForgetPassword,
                    style: TextStyle(
                      fontSize: FontSize.s18,
                      color: ColorManager.black,
                      fontWeight: FontWeightManager.medium,
                    ),
                  ),
                  const SizedBox(height: AppSize.s16),
                  Text(
                    AppStrings.subTitleOfForgetPassword,
                    style: TextStyle(
                      fontSize: FontSize.s14,
                      color: ColorManager.grey,
                      fontWeight: FontWeightManager.regular,
                    ),
                  ),
                  const SizedBox(height: AppSize.s32),
                  CustomTextFormField(
                    controller: _emailController,
                    labelText: AppStrings.email,
                    hintText: AppStrings.enterYourEmail,
                    obscureText: false,
                    validator: (value) =>
                        validateNotEmpty(value, AppStrings.enterValidEmail),
                  ),
                  const SizedBox(height: AppSize.s48),
                  BlocConsumer<ForgotPasswordViewModel, ForgotScreenState>(
                    listener: (context, state) {
                      if (state is LoadingState) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              content: Row(
                                children: [
                                  CircularProgressIndicator(),
                                  Expanded(child: Text('wait')),
                                ],
                              ),
                            );
                          },
                        );
                      }
                      if (state is ErrorState) {
                        var message = extractErrorMessage(state.exception);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Row(
                                children: [
                                  Expanded(child: Text(message)),
                                ],
                              ),
                            );
                          },
                        );
                      }
                      if (state is SuccessState) {
                        SharedData.setData(
                            key: StringCache.emailResetPassword,
                            value: _emailController.text);
                        Navigator.pushNamed(
                            context, RoutesManager.emailVerificationRoute);
                      }
                    },
                    builder: (context, state) {
                      return CustomElevatedButton(
                        title: AppStrings.continuee,
                        buttonColor: buttonColor,
                        onPressed: () {
                          validationMethod(
                            actionPress: () {
                              viewModel.forgotPassword(
                                  email: _emailController.text);
                            },
                            formKey: _formKey,
                            updateButtonColor: (newColor) {
                              setState(() {
                                buttonColor = newColor;
                              });
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
