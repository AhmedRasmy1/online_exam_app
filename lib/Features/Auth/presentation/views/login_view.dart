import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/form_helpers.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/cash_data.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../di/di.dart';
import '../view_model/LoginPage_ViewModel/login_view_cubit.dart';
import '../widgets/bloc_consumer_login_page.dart';
import '../widgets/custom_auth_prompt.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Color buttonColor = ColorManager.blue;
  bool isPasswordHidden = true;
  bool isActiveRemember = false;
  late LoginViewModel viewModel;

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
                    const CustomAppBar(
                      title: AppStrings.login,
                      onTap: null,
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
                      suffix: passwordHidden(
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
                    BlocConsumerForLoginPage(
                      formKey: _formKey,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      buttonColor: buttonColor,
                      viewModel: viewModel,
                      updateButtonColor: (newColor) {
                        setState(() {
                          buttonColor = newColor;
                        });
                      },
                    ),
                    const SizedBox(height: AppSize.s16),
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
