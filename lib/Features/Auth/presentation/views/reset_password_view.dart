import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/Features/Auth/presentation/view_model/reset_view_model.dart';
import 'package:online_exam_app/di/di.dart';
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
  late ResetPasswordViewModel viewModel;
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Color buttonColor = ColorManager.blue;
  bool isPasswordHidden = true;
  bool isPasswordHidden1 = true;


  @override
  void initState() {
    viewModel =getIt.get<ResetPasswordViewModel>();
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
              top: AppPadding.p8, left: AppPadding.p16, right: AppPadding.p16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomAppBar(
                  title: AppStrings.password,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
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
                  alignment: Alignment.center,
                  child: Text(
                    AppStrings.subTitleOfResetPassword,
                    textAlign: TextAlign.center,
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
                  obscureText: isPasswordHidden,
                  validator: (value) =>
                      validateNotEmpty(value, AppStrings.enterValidPassword),
                  suffixIcon: passwordHidden(
                      isPasswordHidden: isPasswordHidden,
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      }),
                ),
                const SizedBox(height: AppSize.s24),
                CustomTextFormField(
                  controller: _confirmNewPasswordController,
                  labelText: AppStrings.confirmPassword,
                  hintText: AppStrings.confirmPassword,
                  obscureText: isPasswordHidden1,
                  validator: (value) => validatePasswordMatch(
                      password: _newPasswordController.text,
                      confirmPassword: _confirmNewPasswordController.text,
                      message: AppStrings.passwordNotMatch),
                  suffixIcon: passwordHidden(
                      isPasswordHidden: isPasswordHidden1,
                      onPressed: () {
                        setState(() {
                          isPasswordHidden1 = !isPasswordHidden1;
                        });
                      }),
                ),
                const SizedBox(height: AppSize.s48),
                CustomElevatedButton(
                  buttonColor: buttonColor,
                  title: AppStrings.continuee,
                  onPressed: () {
                    validationMethod(
                      onPress: () {},
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
    ),
);
  }
}
