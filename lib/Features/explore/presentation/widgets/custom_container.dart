import 'package:flutter/material.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/values_manager.dart';

class CustomContainerForSubject extends StatelessWidget {
  const CustomContainerForSubject({
    super.key,
    required this.iconUrl,
    required this.title,
  });
  final String iconUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Row(
          children: [
            Image.network(iconUrl, height: 50, width: 50),
            const SizedBox(width: AppSize.s8),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: FontSize.s16,
                  color: ColorManager.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
