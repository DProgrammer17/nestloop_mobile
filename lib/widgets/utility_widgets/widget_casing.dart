import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class WidgetCasing extends StatelessWidget {
  final Widget? outerContent;
  final Widget? suffixOuterTitle;
  final Widget content;
  final String outerTitle;
  final String? fieldInfo;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? outerContentPadding;
  const WidgetCasing({
    super.key,
    required this.content,
    this.outerContent,
    this.suffixOuterTitle,
    this.outerTitle = '',
    this.fieldInfo,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
    this.outerContentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.fromLTRB(8.aw, 16.ah, 8.aw, 8.aw),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 24.ar),
        color: backgroundColor ?? AppColors.slateCharcoal06,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: outerContentPadding ?? 16.aw),
            child:
                outerContent ??
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      outerTitle,
                      style: AppTextStyles.h3Inter(context).copyWith(
                        fontSize: 14.asp,
                        color: AppColors.slateCharcoalMain,
                      ),
                    ),
                    if (suffixOuterTitle != null) ...[suffixOuterTitle!],
                  ],
                ),
          ),
          10.sbH,
          content,
          if (fieldInfo != null) ...[
            10.sbH,
            Text(
              fieldInfo!,
              style: AppTextStyles.h2Inter(context).copyWith(
                fontSize: 13.asp,
                color: AppColors.slateCharcoalMain,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
