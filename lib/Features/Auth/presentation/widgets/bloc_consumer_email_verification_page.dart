import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/EmailVerification_ViewModel/email_verification_view_cubit.dart';
import '../view_model/EmailVerification_ViewModel/email_verification_view_state.dart';
import '../../../../core/functions/form_helpers.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class BlocConsumerForOtpVerificationPage extends StatelessWidget {
  final ValueChanged<bool> onCodeInvalid; // Callback for invalid code

  const BlocConsumerForOtpVerificationPage({
    super.key,
    required this.onCodeInvalid, // Required callback
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyCodeViewModel, VerifyCodeState>(
      listener: (context, state) {
        if (state is VerifyCodeSuccess) {
          Navigator.pushNamed(context, RoutesManager.resetPasswordRoute);
        } else if (state is VerifyCodeError) {
          onCodeInvalid(true); // Call the callback when code is invalid
        } else if (state is VerifyCodeLoading) {
          // Show loading dialog
          showAwesomeDialog(
            context: context,
            message: AppStrings.pleaseWait,
            dialogType: DialogType.info,
            onOkPressed: () {},
            btnOkColor: ColorManager.blue,
          );
        }
      },
      builder: (context, state) {
        return const SizedBox.shrink(); // Placeholder when no loading state
      },
    );
  }
}
