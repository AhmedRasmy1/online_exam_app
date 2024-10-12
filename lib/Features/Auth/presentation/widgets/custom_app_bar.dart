import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/values_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset("assets/images/Vector.svg"),
        ),
        const SizedBox(width: AppSize.s8),
        Text(
          title,
          style: TextStyle(
            fontSize: FontSize.s20,
            color: ColorManager.black,
            fontWeight: FontWeightManager.bold,
          ),
        )
      ],
    );
  }
}
