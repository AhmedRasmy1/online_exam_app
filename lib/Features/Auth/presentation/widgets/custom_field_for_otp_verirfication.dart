import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../view_model/EmailVerification_ViewModel/email_verification_view_cubit.dart';
import '../../../../core/functions/extenstions.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/values_manager.dart';

class CustomFieldForOtpVerification extends StatelessWidget {
  const CustomFieldForOtpVerification({
    super.key,
    required List<TextEditingController> controllers,
    required this.viewModel,
    required bool isCodeInvalid,
    required this.index,
  })  : _controllers = controllers,
        _isCodeInvalid = isCodeInvalid;

  final List<TextEditingController> _controllers;
  final VerifyCodeViewModel viewModel;
  final bool _isCodeInvalid;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth / 7.4,
      height: context.screenWidth / 6,
      child: TextFormField(
        controller: _controllers[index],
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (value.length == 1 && index < 5) {
              FocusScope.of(context).nextFocus();
            } else if (index == 5) {
              String enteredOtp =
                  _controllers.map((controller) => controller.text).join();
              viewModel.verifyCode(code: enteredOtp);
              FocusScope.of(context).unfocus();
            }
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
        keyboardType: const TextInputType.numberWithOptions(),
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorManager.colorOfEmailverification,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: _isCodeInvalid
                  ? ColorManager.error
                  : ColorManager.colorOfEmailverification,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: _isCodeInvalid
                  ? ColorManager.error
                  : ColorManager.colorOfEmailverification,
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: AppPadding.p24,
          ),
        ),
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
