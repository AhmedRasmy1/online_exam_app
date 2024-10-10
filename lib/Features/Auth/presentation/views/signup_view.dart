import 'package:flutter/material.dart';
import 'package:online_exam_app/Features/Auth/presentation/widgets/custom_app_bar.dart';
import 'package:online_exam_app/Features/Auth/presentation/widgets/custom_auth_prompt.dart';
import 'package:online_exam_app/Features/Auth/presentation/widgets/custom_elevated_button.dart';
import 'package:online_exam_app/Features/Auth/presentation/widgets/custom_text_form_field.dart';
import 'package:online_exam_app/core/functions/extenstions.dart';
import 'package:online_exam_app/core/resources/app_constants.dart';
import 'package:online_exam_app/core/resources/color_manager.dart';
import 'package:online_exam_app/core/resources/routes_manager.dart';
import 'package:online_exam_app/core/resources/strings_manager.dart';
import 'package:online_exam_app/core/resources/values_manager.dart';

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
        body: Padding(
          padding: const EdgeInsets.only(
              top: AppPadding.p8, left: AppPadding.p16, right: AppPadding.p16),
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
      ),
    );
  }
}
