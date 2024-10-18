import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/SigninPage_ViewModel/signin_view_cubit.dart';
import '../view_model/SigninPage_ViewModel/signin_view_state.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/functions/form_helpers.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class BlocConsumerForSignupPage extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController userNameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;
  final Color buttonColor;
  final Function(Color) updateButtonColor;
  final RigesterViewModel viewModel;

  const BlocConsumerForSignupPage({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.userNameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.confirmPasswordController,
    required this.phoneController,
    required this.buttonColor,
    required this.updateButtonColor,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RigesterViewModel, RigesterScreenState>(
      listener: (context, state) {
        if (state is LoadingRigesterState) {
          showAwesomeDialog(
            context: context,
            message: AppStrings.pleaseWait,
            dialogType: DialogType.info,
            onOkPressed: () {},
            btnOkColor: ColorManager.blue,
          );
        }
        if (state is ErrorRigesterState) {
          // var message = extractErrorMessage(state.exception); // todo message
          showAwesomeDialog(
            context: context,
            message: AppStrings.somethingWentWrong,
            dialogType: DialogType.error,
            onOkPressed: () {},
            btnOkColor: ColorManager.error,
          );
        }
        if (state is SuccessRigesterState) {
          showAwesomeDialog(
            context: context,
            message: AppStrings.successfullyCreated,
            dialogType: DialogType.success,
            onOkPressed: () {
              Navigator.pushNamed(context, RoutesManager.loginRoute);
            },
            btnOkColor: ColorManager.green,
          );
        }
      },
      builder: (context, state) {
        return CustomElevatedButton(
          buttonColor: buttonColor,
          title: AppStrings.signUp,
          onPressed: () {
            validationMethod(
              actionPress: () {
                viewModel.register(
                  username: userNameController.text,
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                  rePassword: confirmPasswordController.text,
                  phone: phoneController.text,
                );
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
