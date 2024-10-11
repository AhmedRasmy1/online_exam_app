import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';
import '../../../../core/functions/form_validators.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController _emailController = TextEditingController();
  Color buttonColor = ColorManager.blue;

  final _formKey = GlobalKey<FormState>();

  void forgetPassword() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        buttonColor = ColorManager.blue;
        Navigator.pushNamed(context, RoutesManager.emailVerificationRoute);
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
                const CustomAppBar(title: AppStrings.password),
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
                  validatorMessage: AppStrings.enterValidEmail,
                  obscureText: false,
                  validator: (value) =>
                      validateNotEmpty(value, AppStrings.enterValidEmail),
                ),
                const SizedBox(height: AppSize.s48),
                CustomElevatedButton(
                  title: AppStrings.continuee,
                  buttonColor: buttonColor,
                  onPressed: forgetPassword,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
