import 'package:flutter/material.dart';
import 'package:online_exam_app/Features/Auth/presentation/widgets/custom_app_bar.dart';
import 'package:online_exam_app/Features/Auth/presentation/widgets/custom_elevated_button.dart';
import 'package:online_exam_app/Features/Auth/presentation/widgets/custom_text_form_field.dart';
import 'package:online_exam_app/core/resources/color_manager.dart';
import 'package:online_exam_app/core/resources/font_manager.dart';
import 'package:online_exam_app/core/resources/styles_manager.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Color buttonColor = ColorManager.blue;

  void _login() {
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
                const CustomAppBar(title: AppStrings.login),
                const SizedBox(height: AppSize.s24),
                CustomTextFormField(
                  controller: _emailController,
                  labelText: AppStrings.email,
                  hintText: AppStrings.enterYourEmail,
                  validatorMessage: AppStrings.enterValidEmail,
                ),
                const SizedBox(height: AppSize.s24),
                CustomTextFormField(
                  controller: _passwordController,
                  labelText: AppStrings.password,
                  hintText: AppStrings.enterYourPassword,
                  validatorMessage: AppStrings.enterValidPassword,
                ),
                const SizedBox(height: AppSize.s16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    const Text(
                      AppStrings.rememberMe,
                      style: TextStyle(
                          fontSize: FontSize.s14, color: ColorManager.black),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
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
                CustomElevatedButton(
                  buttonColor: buttonColor,
                  title: AppStrings.login,
                  onPressed: _login,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
