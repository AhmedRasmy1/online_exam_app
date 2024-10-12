import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/Uitls/Uitls.dart';
import '../../../../di/di.dart';
import '../view_model/view_model.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_auth_prompt.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';
import '../../../../core/functions/extenstions.dart';
import '../../../../core/functions/form_helpers.dart';
import '../../../../core/resources/app_constants.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late LoginViewModel viewModel;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Color buttonColor = ColorManager.blue;

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
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: AppPadding.p8,
                    left: AppPadding.p16,
                    right: AppPadding.p16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const CustomAppBar(title: AppStrings.signUp),
                      const SizedBox(height: AppSize.s24),
                      CustomTextFormField(
                        controller: _userNameController,
                        labelText: AppStrings.userName,
                        hintText: AppStrings.enterYourUserName,
                        obscureText: false,
                        validator: (value) => validateNotEmpty(
                            value, AppStrings.enterValidUserName),
                      ),
                      const SizedBox(height: AppSize.s24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: context.screenWidth /
                                AppConstants.screenWidthRatio,
                            child: CustomTextFormField(
                              controller: _firstNameController,
                              labelText: AppStrings.firstName,
                              hintText: AppStrings.enterYourFirstName,
                              obscureText: false,
                              validator: (value) => validateNotEmpty(
                                  value, AppStrings.entervalidfirstName),
                            ),
                          ),
                          SizedBox(
                            width: context.screenWidth /
                                AppConstants.screenWidthRatio,
                            child: CustomTextFormField(
                              controller: _lastNameController,
                              labelText: AppStrings.lastName,
                              hintText: AppStrings.enterYourLastName,
                              obscureText: false,
                              validator: (value) => validateNotEmpty(
                                  value, AppStrings.entervalidLastName),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s24),
                      CustomTextFormField(
                        controller: _emailController,
                        labelText: AppStrings.email,
                        hintText: AppStrings.enterYourEmail,
                        obscureText: false,
                        validator: (value) =>
                            validateNotEmpty(value, AppStrings.enterValidEmail),
                      ),
                      const SizedBox(height: AppSize.s24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: context.screenWidth /
                                AppConstants.screenWidthRatio,
                            child: CustomTextFormField(
                              controller: _passwordController,
                              labelText: AppStrings.password,
                              hintText: AppStrings.enterYourPassword,
                              obscureText: true,
                              validator: (value) => validateNotEmpty(
                                  value, AppStrings.enterValidPassword),
                            ),
                          ),
                          SizedBox(
                            width: context.screenWidth /
                                AppConstants.screenWidthRatio,
                            child: CustomTextFormField(
                              controller: _confirmPasswordController,
                              labelText: AppStrings.confirmPassword,
                              hintText: AppStrings.enterYourConfirmPassword,
                              obscureText: true,
                              validator: (value) => validatePasswordMatch(
                                  password: _passwordController.text,
                                  confirmPassword:
                                      _confirmPasswordController.text,
                                  message: AppStrings.passwordNotMatch),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s24),
                      CustomTextFormField(
                        controller: _phoneController,
                        labelText: AppStrings.phoneNumber,
                        hintText: AppStrings.enterPhoneNumber,
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.enterValidPhoneNumber;
                          }
                          return null;
                        },
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
                                      Expanded(child: Text('user add')),
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
                            title: AppStrings.signUp,
                            onPressed: () {
                              validationMethod(
                                onPress: () {
                                  viewModel.register(
                                      username: _userNameController.text,
                                      firstName: _firstNameController.text,
                                      lastName: _lastNameController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      rePassword:
                                          _confirmPasswordController.text,
                                      phone: _phoneController.text);
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
                        message: AppStrings.alreadyHaveAccount,
                        userAccess: AppStrings.login,
                        routeName: RoutesManager.loginRoute,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
