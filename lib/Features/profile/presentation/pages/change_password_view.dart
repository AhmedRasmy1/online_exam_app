import 'package:flutter/material.dart';
import 'package:online_exam_app/core/functions/form_helpers.dart';
import 'package:online_exam_app/core/resources/color_manager.dart';
import 'package:online_exam_app/core/resources/strings_manager.dart';
import 'package:online_exam_app/core/resources/values_manager.dart';
import 'package:online_exam_app/core/widgets/custom_app_bar.dart';
import 'package:online_exam_app/core/widgets/custom_elevated_button.dart';
import 'package:online_exam_app/core/widgets/custom_text_form_field.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final TextEditingController _currentPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _reNewPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPasswordHidden1 = true;
  bool isPasswordHidden2 = true;
  bool isPasswordHidden3 = true;
  Color buttonColor = ColorManager.blue;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: AppPadding.p8,
            left: AppPadding.p16,
            right: AppPadding.p16,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomAppBar(
                  title: AppStrings.resetPassword,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: AppSize.s32),
                CustomTextFormField(
                  controller: _currentPassword,
                  labelText: AppStrings.currentPassword,
                  hintText: AppStrings.enterYourPassword,
                  obscureText: isPasswordHidden1,
                  validator: (value) => validateNotEmpty(
                      value,
                      AppStrings.enterValidPassword,
                      AppStrings.passwordLengthError,
                      AppStrings.passwordFormatError),
                  suffix: passwordHidden(
                      isPasswordHidden: isPasswordHidden1,
                      onPressed: () {
                        setState(() {
                          isPasswordHidden1 = !isPasswordHidden1;
                        });
                      }),
                ),
                const SizedBox(height: AppSize.s24),
                CustomTextFormField(
                  controller: _newPassword,
                  labelText: AppStrings.newPassword,
                  hintText: AppStrings.enterYourPassword,
                  obscureText: isPasswordHidden2,
                  validator: (value) => validateNotEmpty(
                      value,
                      AppStrings.enterValidPassword,
                      AppStrings.passwordLengthError,
                      AppStrings.passwordFormatError),
                  suffix: passwordHidden(
                      isPasswordHidden: isPasswordHidden2,
                      onPressed: () {
                        setState(() {
                          isPasswordHidden2 = !isPasswordHidden2;
                        });
                      }),
                ),
                const SizedBox(height: AppSize.s24),
                CustomTextFormField(
                  controller: _reNewPassword,
                  labelText: AppStrings.confirmNewPassword,
                  hintText: AppStrings.enterYourPassword,
                  obscureText: isPasswordHidden3,
                  validator: (value) => validatePasswordMatch(
                    password: _newPassword.text,
                    confirmPassword: _reNewPassword.text,
                    message: AppStrings.passwordNotMatch,
                  ),
                  suffix: passwordHidden(
                      isPasswordHidden: isPasswordHidden3,
                      onPressed: () {
                        setState(() {
                          isPasswordHidden3 = !isPasswordHidden3;
                        });
                      }),
                ),
                const SizedBox(height: AppSize.s54),
                CustomElevatedButton(
                  buttonColor: buttonColor,
                  title: AppStrings.update,
                  onPressed: () {
                    validationMethod(
                      actionPress: () {},
                      formKey: _formKey,
                      updateButtonColor: (buttonColor) {
                        setState(
                          () {
                            this.buttonColor = buttonColor;
                          },
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
