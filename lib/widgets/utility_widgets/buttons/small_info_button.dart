import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class SmallInfoButton extends StatelessWidget {
  final Widget leading;
  final String title;
  final VoidCallback onTap;
  final Color? backgroundColor;
  const SmallInfoButton({
    super.key,
    required this.leading,
    required this.title,
    required this.onTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.58.ah, horizontal: 16.58.aw),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.ar),
          color: backgroundColor ?? AppColors.slateCharcoal06,
        ),
        child: Center(
          child: Row(
            children: [
              leading,
              7.sbW,
              Text(
                title,
                style: AppTextStyles.body2RegularInter(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
