import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/extenstions.dart';
import '../../../../core/functions/form_helpers.dart';
import '../../../../core/resources/app_constants.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../di/di.dart';
import '../view_model/SigninPage_ViewModel/signin_view_cubit.dart';
import '../widgets/bloc_consumer_signin_page.dart';
import '../widgets/custom_auth_prompt.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late RigesterViewModel viewModel;
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
  bool isPasswordHidden1 = true;
  bool isPasswordHidden2 = true;

  @override
  void initState() {
    viewModel = getIt.get<RigesterViewModel>();
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
                      CustomAppBar(
                        title: AppStrings.signUp,
                        color: ColorManager.black,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
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
                        keyboardType: TextInputType.emailAddress,
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
                              obscureText: isPasswordHidden1,
                              validator: (value) => validateNotEmpty(
                                value,
                                AppStrings.enterValidPassword,
                              ),
                              suffix: passwordHidden(
                                  isPasswordHidden: isPasswordHidden1,
                                  onPressed: () {
                                    setState(() {
                                      isPasswordHidden1 = !isPasswordHidden1;
                                    });
                                  }),
                            ),
                          ),
                          SizedBox(
                            width: context.screenWidth /
                                AppConstants.screenWidthRatio,
                            child: CustomTextFormField(
                              controller: _confirmPasswordController,
                              labelText: AppStrings.confirmPassword,
                              hintText: AppStrings.enterYourConfirmPassword,
                              obscureText: isPasswordHidden2,
                              validator: (value) => validatePasswordMatch(
                                  password: _passwordController.text,
                                  confirmPassword:
                                      _confirmPasswordController.text,
                                  message: AppStrings.passwordNotMatch),
                              suffix: passwordHidden(
                                  isPasswordHidden: isPasswordHidden2,
                                  onPressed: () {
                                    setState(() {
                                      isPasswordHidden2 = !isPasswordHidden2;
                                    });
                                  }),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s24),
                      CustomTextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        labelText: AppStrings.phoneNumber,
                        hintText: AppStrings.enterPhoneNumber,
                        obscureText: false,
                        validator: (value) => validateNotEmpty(
                          value,
                          AppStrings.enterValidPhoneNumber,
                        ),
                      ),
                      const SizedBox(height: AppSize.s48),
                      BlocConsumerForSignupPage(
                        formKey: _formKey,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        userNameController: _userNameController,
                        firstNameController: _firstNameController,
                        lastNameController: _lastNameController,
                        confirmPasswordController: _confirmPasswordController,
                        phoneController: _phoneController,
                        buttonColor: buttonColor,
                        viewModel: viewModel,
                        updateButtonColor: (newColor) {
                          setState(() {
                            buttonColor = newColor;
                          });
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
