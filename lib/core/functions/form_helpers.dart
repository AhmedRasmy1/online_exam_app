import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../resources/values_manager.dart';

import '../resources/color_manager.dart';

String? validateNotEmpty(String? value, String messageEmpty,
    [String? length, String? format]) {
  if (value?.trim() == null || value!.trim().isEmpty) {
    return messageEmpty;
  } else if (value.length < 6) {
    return length;
  } else if (!RegExp(r'^(?=.*[A-Z])(?=.*\d).{6,}$').hasMatch(value)) {
    return format;
  }
  return null;
}

String? validatePhone(String? value, String message, String messageLength,
    String messageStartWithZero) {
  if (value?.trim() == null || value!.trim().isEmpty) {
    return message;
  } else if (!RegExp(r'^01[0125][0-9]{8}$').hasMatch(value)) {
    return messageLength;
  }
  return null;
}

String? validatePasswordMatch({
  required String password,
  required String confirmPassword,
  required String message,
}) {
  if (password != confirmPassword) {
    return message;
  }
  return null;
}

void validationMethod({
  required GlobalKey<FormState> formKey,
  required Function(Color) updateButtonColor,
  required void Function() actionPress,
}) {
  if (formKey.currentState!.validate()) {
    actionPress();
    updateButtonColor(ColorManager.blue);
  } else {
    updateButtonColor(ColorManager.darkgrey);
  }
}

Widget passwordHidden({
  required bool isPasswordHidden,
  required void Function()? onPressed,
}) {
  return IconButton(
    icon: Icon(
      isPasswordHidden ? Icons.visibility_off : Icons.visibility,
    ),
    onPressed: onPressed,
  );
}

void showAwesomeDialog({
  required BuildContext context,
  required String message,
  required DialogType dialogType,
  required VoidCallback onOkPressed,
  required Color btnOkColor,
}) {
  AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: dialogType,
    body: Center(
      child: Text(
        message,
        style: const TextStyle(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    btnOkOnPress: onOkPressed,
    btnOkColor: btnOkColor,
  ).show();
}

Widget buildIcon(String assetPath, int index, int currentIndex) {
  bool isSelected = index == currentIndex;

  return Container(
    padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20, vertical: AppPadding.p4),
    decoration: BoxDecoration(
      color:
          isSelected ? ColorManager.blue.withOpacity(0.2) : Colors.transparent,
      borderRadius: BorderRadius.circular(12),
    ),
    child: SvgPicture.asset(
      assetPath,
      width: 24,
      height: 24,
      colorFilter: ColorFilter.mode(
        isSelected ? ColorManager.blue : ColorManager.grey,
        BlendMode.srcIn,
      ),
    ),
  );
}
