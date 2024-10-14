import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/utils/cash_data.dart';

import '../../../../core/functions/form_helpers.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/Uitls.dart';
import '../../../../di/di.dart';
import '../view_model/view_model.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_auth_prompt.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  createState() => _LoginViewState();
}

late LoginViewModel viewModel;

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Color buttonColor = ColorManager.blue;
  bool isPasswordHidden = true;
  bool isActiveRemember = false;
  @override
  void initState() {
    viewModel = getIt.get<LoginViewModel>();
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomAppBar(
                      title: AppStrings.login,
                      onTap: () {},
                    ),
                    const SizedBox(height: AppSize.s24),
                    CustomTextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      labelText: AppStrings.email,
                      hintText: AppStrings.enterYourEmail,
                      obscureText: false,
                      validator: (value) =>
                          validateNotEmpty(value, AppStrings.enterValidEmail),
                    ),
                    const SizedBox(height: AppSize.s24),
                    CustomTextFormField(
                      controller: _passwordController,
                      labelText: AppStrings.password,
                      hintText: AppStrings.enterYourPassword,
                      obscureText: isPasswordHidden,
                      validator: (value) => validateNotEmpty(
                          value, AppStrings.enterValidPassword),
                      suffixIcon: passwordHidden(
                        isPasswordHidden: isPasswordHidden,
                        onPressed: () {
                          setState(() {
                            isPasswordHidden = !isPasswordHidden;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: AppSize.s16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: isActiveRemember,
                          onChanged: (value) {
                            setState(() {
                              isActiveRemember = value ?? false;
                              if (isActiveRemember) {
                                SharedData.setData(
                                    key: StringCache.isActiveRemember,
                                    value: true);
                              }
                            });
                          },
                        ),
                        const Text(
                          AppStrings.rememberMe,
                          style: TextStyle(
                              fontSize: FontSize.s14,
                              color: ColorManager.black),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.restorablePushNamed(
                                context, RoutesManager.forgetPasswordRoute);
                          },
                          child: Text(
                            AppStrings.forgetPassword,
                            style: getRegularStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSize.s48),
                    BlocConsumer<LoginViewModel, LoginScreenState>(
                      listenWhen: (previous, current) {
                        return true;
                      },
                      listener: (context, state) {
                        if (state is LoadingState) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                content: Row(
                                  children: [
                                    CircularProgressIndicator(),
                                    Expanded(child: Text('message')),
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
                          if (SharedData.getData(
                              key: StringCache.isActiveRemember)) {
                            SharedData.setData(
                                key: StringCache.userEmail,
                                value: _emailController.text);
                            SharedData.setData(
                                key: StringCache.userPassword,
                                value: _passwordController.text);
                          }
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                content: Row(
                                  children: [
                                    Expanded(child: Text('message')),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                      builder: (context, state) {
                        return CustomElevatedButton(
                          buttonColor: buttonColor,
                          title: AppStrings.login,
                          onPressed: () {
                            //
                            validationMethod(
                              onPress: () {
                                viewModel.login(_emailController.text,
                                    _passwordController.text);
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
                    const AuthPrompt(
                      message: AppStrings.dontHaveAccount,
                      userAccess: AppStrings.signUp,
                      routeName: RoutesManager.registerRoute,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
