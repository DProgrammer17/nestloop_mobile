import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_switch.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class InfoSwitchTile extends StatelessWidget {
  final Widget leadingIcon;
  final String title;
  final String subtitle;
  final bool enabled;
  final ValueChanged onEnabled;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Widget? bottomContent;
  final double? bottomSpacing;
  const InfoSwitchTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.subtitle,
    required this.enabled,
    required this.onEnabled,
    this.backgroundColor,
    this.padding,
    this.titleStyle,
    this.subtitleStyle,
    this.bottomContent,
    this.bottomSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return WidgetCasing(
      backgroundColor: backgroundColor ?? AppColors.baseBackground,
      padding: padding ?? EdgeInsets.fromLTRB(8.aw, 16.ah, 8.aw, 16.ah),
      outerContent: const SizedBox.shrink(),
      contentSpacing: 0,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  leadingIcon,
                  12.sbW,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: titleStyle ?? AppTextStyles.h3Inter(
                          context,
                        ).copyWith(fontWeight: FontWeight.w500),
                      ),
                      4.sbH,
                      SizedBox(
                        width: 220.aw,
                        child: Text(
                          subtitle,
                          style: subtitleStyle ?? AppTextStyles.body2RegularInter(
                            context,
                          ).copyWith(color: AppColors.slateCharcoal60),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if(bottomContent != null)...[
                (bottomSpacing ?? 10).sbH,
                bottomContent!,
              ],
            ],
          ),
          10.sbW,
          AppSwitch(selected: enabled, onChanged: onEnabled),
        ],
      ),
    );
  }
}
