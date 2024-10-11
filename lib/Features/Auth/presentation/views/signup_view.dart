import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_auth_prompt.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';
import '../../../../core/functions/extenstions.dart';
import '../../../../core/functions/form_validators.dart';
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

  String? _validatePasswordMatch(String message) {
    if (_passwordController.text != _confirmPasswordController.text) {
      return message;
    }
    return null;
  }

  void signUpp() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        buttonColor = ColorManager.blue;
      });
    } else {
      setState(() {
        buttonColor = ColorManager.darkgrey;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
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
                    validatorMessage: AppStrings.enterValidUserName,
                    obscureText: false,
                    validator: (value) =>
                        validateNotEmpty(value, AppStrings.enterValidUserName),
                  ),
                  const SizedBox(height: AppSize.s24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width:
                            context.screenWidth / AppConstants.screenWidthRatio,
                        child: CustomTextFormField(
                          controller: _firstNameController,
                          labelText: AppStrings.firstName,
                          hintText: AppStrings.enterYourFirstName,
                          validatorMessage: AppStrings.entervalidfirstName,
                          obscureText: false,
                          validator: (value) => validateNotEmpty(
                              value, AppStrings.entervalidfirstName),
                        ),
                      ),
                      SizedBox(
                        width:
                            context.screenWidth / AppConstants.screenWidthRatio,
                        child: CustomTextFormField(
                          controller: _lastNameController,
                          labelText: AppStrings.lastName,
                          hintText: AppStrings.enterYourLastName,
                          validatorMessage: AppStrings.entervalidLastName,
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
                    validatorMessage: AppStrings.enterValidEmail,
                    obscureText: false,
                    validator: (value) =>
                        validateNotEmpty(value, AppStrings.enterValidEmail),
                  ),
                  const SizedBox(height: AppSize.s24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width:
                            context.screenWidth / AppConstants.screenWidthRatio,
                        child: CustomTextFormField(
                          controller: _passwordController,
                          labelText: AppStrings.password,
                          hintText: AppStrings.enterYourPassword,
                          validatorMessage: AppStrings.enterValidPassword,
                          obscureText: true,
                          validator: (value) => validateNotEmpty(
                              value, AppStrings.enterValidPassword),
                        ),
                      ),
                      SizedBox(
                        width:
                            context.screenWidth / AppConstants.screenWidthRatio,
                        child: CustomTextFormField(
                          controller: _confirmPasswordController,
                          labelText: AppStrings.confirmPassword,
                          hintText: AppStrings.enterYourConfirmPassword,
                          validatorMessage: AppStrings.passwordNotMatch,
                          obscureText: true,
                          validator: (value) => _validatePasswordMatch(
                              AppStrings.passwordNotMatch),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.s24),
                  CustomTextFormField(
                    controller: _phoneController,
                    labelText: AppStrings.phoneNumber,
                    hintText: AppStrings.enterPhoneNumber,
                    validatorMessage: AppStrings.enterValidPhoneNumber,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.enterValidPhoneNumber;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: AppSize.s48),
                  CustomElevatedButton(
                    buttonColor: buttonColor,
                    title: AppStrings.signUp,
                    onPressed: signUpp,
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
        ]),
      ),
    );
  }
}
