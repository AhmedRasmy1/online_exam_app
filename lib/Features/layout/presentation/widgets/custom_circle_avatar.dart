import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/values_manager.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Circular Avatar
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: SvgPicture.asset(
              'assets/images/avatar.svg',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Camera Icon Positioned in the bottom-right
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.only(
              top: AppPadding.p4,
              right: AppPadding.p4,
              left: AppPadding.p4,
              bottom: AppPadding.p4,
            ),
            decoration: BoxDecoration(
                color: ColorManager.lightPrimary,
                borderRadius: BorderRadius.circular(6)),
            child: SvgPicture.asset(
              'assets/images/camera_svg.svg',
              colorFilter: const ColorFilter.mode(
                ColorManager.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
