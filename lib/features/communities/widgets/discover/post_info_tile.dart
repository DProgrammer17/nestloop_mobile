import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class PostInfoTile extends StatelessWidget {
  final Widget? leading;
  final IconData? icon;
  final double? size;
  final Color? iconColor;
  final Color? textColor;
  final String info;
  const PostInfoTile({
    super.key,
    this.leading,
    this.icon,
    this.size,
    this.iconColor,
    this.textColor,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        leading ??
            Icon(
              icon,
              size: size ?? 14.ar,
              color: iconColor ?? AppColors.baseBackground,
            ),
        4.sbW,
        Text(
          info,
          style: AppTextStyles.body1RegularInter(
            context,
          ).copyWith(color: textColor ?? AppColors.slateCharcoal40),
        ),
      ],
    );
  }
}
