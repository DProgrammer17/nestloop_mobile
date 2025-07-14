import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class TextFieldOuterTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final TextStyle? titleStyle;
  final Widget? suffixIcon;
  final bool isRequired;
  const TextFieldOuterTile({
    super.key,
    required this.leading,
    required this.title,
    this.titleStyle,
    this.suffixIcon,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            leading,
            10.sbW,
            Text(
              title,
              style: titleStyle ?? AppTextStyles.h3Inter(context).copyWith(fontSize: 14.asp),
            ),
            if(isRequired)...[
              3.sbW,
              Icon(
                Icons.emergency,
                size: 10.ar,
                color: AppColors.baseRed,
              ),
            ],
          ],
        ),
        if (suffixIcon != null) ...[
          Padding(
            padding: EdgeInsets.only(right: 8.aw),
            child: suffixIcon!,
          ),
        ],
      ],
    );
  }
}
