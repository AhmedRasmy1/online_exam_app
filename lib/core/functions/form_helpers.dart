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
}) {
  if (formKey.currentState!.validate()) {
    updateButtonColor(ColorManager.blue);
  } else {
    updateButtonColor(ColorManager.darkgrey);
  }
}
