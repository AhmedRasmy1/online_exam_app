import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';
import '../../../../core/functions/form_helpers.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});
  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Color buttonColor = ColorManager.blue;
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
                const CustomAppBar(title: AppStrings.password),
                const SizedBox(height: AppSize.s40),
                Text(
                  AppStrings.titleOfResetPassword,
                  style: TextStyle(
                    fontSize: FontSize.s18,
                    color: ColorManager.black,
                    fontWeight: FontWeightManager.medium,
                  ),
                ),
                const SizedBox(height: AppSize.s16),
                Align(
                  alignment: Alignment.center, // بدل Alignment.topCenter
                  child: Text(
                    AppStrings.subTitleOfResetPassword,
                    textAlign:
                        TextAlign.center, // دي اللي هتخلي النص كله في النص
                    style: TextStyle(
                      fontSize: FontSize.s14,
                      color: ColorManager.grey,
                      fontWeight: FontWeightManager.regular,
                    ),
                  ),
                ),
                const SizedBox(height: AppSize.s32),
                CustomTextFormField(
                  controller: _newPasswordController,
                  labelText: AppStrings.newPassword,
                  hintText: AppStrings.enterYourPassword,
                  obscureText: true,
                  validator: (value) =>
                      validateNotEmpty(value, AppStrings.enterValidPassword),
                ),
                const SizedBox(height: AppSize.s24),
                CustomTextFormField(
                  controller: _confirmNewPasswordController,
                  labelText: AppStrings.confirmPassword,
                  hintText: AppStrings.confirmPassword,
                  obscureText: true,
                  validator: (value) => validatePasswordMatch(
                      password: _newPasswordController.text,
                      confirmPassword: _confirmNewPasswordController.text,
                      message: AppStrings.passwordNotMatch),
                ),
                const SizedBox(height: AppSize.s48),
                CustomElevatedButton(
                  buttonColor: buttonColor,
                  title: AppStrings.continuee,
                  onPressed: () {
                    validationMethod(
                      onPress:() {

                      } ,
                      formKey: _formKey,
                      updateButtonColor: (newColor) {
                        setState(() {
                          buttonColor = newColor;
                        });
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
