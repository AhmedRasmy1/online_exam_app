import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/Resetpage_ViewModel/reset_password_view_cubit.dart';
import '../view_model/Resetpage_ViewModel/reset_password_view_state.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/functions/form_helpers.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/cash_data.dart';

class BlocConsumerForResetPassword extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController newPasswordController;
  final ResetPasswordViewModel viewModel;
  final Color buttonColor;
  final Function(Color) updateButtonColor;

  const BlocConsumerForResetPassword({
    super.key,
    required this.formKey,
    required this.newPasswordController,
    required this.viewModel,
    required this.buttonColor,
    required this.updateButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordViewModel, ResetPasswordState>(
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
        if (state is ResetPasswordSuccessState) {
          SharedData.deleteItem(key: StringCache.emailResetPassword);
          Navigator.pushReplacementNamed(context, RoutesManager.loginRoute);
        }
        if (state is ErrorState) {
          showAwesomeDialog(
            context: context,
            message: AppStrings.didntMatchReqirment,
            dialogType: DialogType.error,
            onOkPressed: () {},
            btnOkColor: ColorManager.error,
          );
        }
      },
      builder: (context, state) {
        return CustomElevatedButton(
          buttonColor: buttonColor,
          title: AppStrings.continuee,
          onPressed: () {
            validationMethod(
              actionPress: () {
                viewModel.resetPassword(
                    newPassword: newPasswordController.text);
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
