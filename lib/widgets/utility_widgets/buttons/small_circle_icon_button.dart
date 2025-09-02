import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';

class SmallCircleIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  const SmallCircleIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.height,
    this.width,
    this.backgroundColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 48.ah,
        width: width ?? 48.aw,
        padding:
            padding ?? EdgeInsets.symmetric(vertical: 12.ah, horizontal: 12.aw),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor ?? AppColors.baseBackground,
        ),
        child: icon,
      ),
    );
  }
}
