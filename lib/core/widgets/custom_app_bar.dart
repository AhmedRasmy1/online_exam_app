import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../resources/font_manager.dart';
import '../resources/values_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.onTap,
    required this.color,
  });
  final String title;
  final void Function()? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (onTap != null)
          GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset("assets/images/Vector.svg"),
          ),
        const SizedBox(width: AppSize.s8),
        Text(
          title,
          style: TextStyle(
            fontSize: FontSize.s20,
            color: color,
            fontWeight: FontWeightManager.bold,
          ),
        )
      ],
    );
  }
}
