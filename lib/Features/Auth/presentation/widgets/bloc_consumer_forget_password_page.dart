import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/ForgetPasswordPage_viewModel/forget_password_view_cubit.dart';
import '../view_model/ForgetPasswordPage_viewModel/forget_password_view_state.dart';
import 'custom_elevated_button.dart';
import '../../../../core/functions/form_helpers.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/cash_data.dart';

class BlocConsumerForForgetPasswordPage extends StatelessWidget {
  final TextEditingController emailController;
  final Color buttonColor;
  final GlobalKey<FormState> formKey;

  const BlocConsumerForForgetPasswordPage({
    super.key,
    required this.emailController,
    required this.buttonColor,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordViewModel, ForgotScreenState>(
      listener: (context, state) {
        if (state is LoadingState) {
          showAwesomeDialog(
            context: context,
            message: AppStrings.pleaseWait,
            dialogType: DialogType.info,
            onOkPressed: () {},
            btnOkColor: ColorManager.blue,
          );
        }
        if (state is ErrorState) {
          // var message = extractErrorMessage(state.exception); //todo message
          showAwesomeDialog(
            context: context,
            message: AppStrings.enterValidEmail,
            dialogType: DialogType.error,
            onOkPressed: () {},
            btnOkColor: ColorManager.error,
          );
        }
        if (state is SuccessState) {
          SharedData.setData(
            key: StringCache.emailResetPassword,
            value: emailController.text,
          );
          Navigator.pushNamed(context, RoutesManager.emailVerificationRoute);
        }
      },
      builder: (context, state) {
        return CustomElevatedButton(
          title: AppStrings.continuee,
          buttonColor: buttonColor,
          onPressed: () {
            validationMethod(
              actionPress: () {
                context.read<ForgotPasswordViewModel>().forgotPassword(
                      email: emailController.text,
                    );
              },
              formKey: formKey,
              updateButtonColor: (newColor) {},
            );
          },
        );
      },
    );
  }
}
