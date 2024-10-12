import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

String? validateNotEmpty(String? value, String message) {
  if (value == null || value.isEmpty) {
    return message;
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
  required void Function() onPress,
}) {
  if (formKey.currentState!.validate()) {
    onPress();
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
