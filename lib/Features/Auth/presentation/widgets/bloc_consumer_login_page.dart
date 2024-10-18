import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/resources/routes_manager.dart';
import '../view_model/LoginPage_ViewModel/login_view_cubit.dart';
import '../view_model/LoginPage_ViewModel/login_view_state.dart';
import 'custom_elevated_button.dart';
import '../../../../core/functions/form_helpers.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/cash_data.dart';

class BlocConsumerForLoginPage extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Color buttonColor;
  final Function(Color) updateButtonColor;
  final LoginViewModel viewModel;

  const BlocConsumerForLoginPage({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.buttonColor,
    required this.updateButtonColor,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginViewModel, LoginScreenState>(
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
          // var message = extractErrorMessage(state.exception);
          showAwesomeDialog(
            context: context,
            message: AppStrings.invalidEmailOrPassword, //todo message
            dialogType: DialogType.error,
            onOkPressed: () {},
            btnOkColor: ColorManager.error,
          );
        }
        if (state is SuccessState) {
          if (SharedData.getData(key: StringCache.isActiveRemember)) {
            SharedData.setData(
                key: StringCache.userEmail, value: emailController.text);
            SharedData.setData(
                key: StringCache.userPassword, value: passwordController.text);
          }
          showAwesomeDialog(
            context: context,
            message: AppStrings.successfullyLogin,
            dialogType: DialogType.success,
            onOkPressed: () {},
            btnOkColor: ColorManager.green,
          );
          Navigator.pushNamed(context, RoutesManager.homeRoute);
        }
      },
      builder: (context, state) {
        return CustomElevatedButton(
          buttonColor: buttonColor,
          title: AppStrings.login,
          onPressed: () {
            validationMethod(
              actionPress: () {
                viewModel.login(emailController.text, passwordController.text);
              },
              formKey: formKey,
              updateButtonColor: updateButtonColor,
            );
          },
        );
      },
    );
  }
}
