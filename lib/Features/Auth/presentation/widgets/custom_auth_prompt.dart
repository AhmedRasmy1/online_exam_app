import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';

class AuthPrompt extends StatelessWidget {
  const AuthPrompt({
    super.key,
    required this.message,
    required this.userAccess,
    required this.routeName,
  });
  final String message;
  final String userAccess;
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: const TextStyle(
              fontSize: FontSize.s16, color: ColorManager.black),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, routeName);
          },
          child: Text(
            userAccess,
            style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: ColorManager.blue,
                fontSize: FontSize.s16,
                color: ColorManager.blue,
                fontWeight: FontWeightManager.semiBold),
          ),
        ),
      ],
    );
  }
}
