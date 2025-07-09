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
  const InfoSwitchTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.subtitle,
    required this.enabled,
    required this.onEnabled,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return WidgetCasing(
      backgroundColor: backgroundColor ?? AppColors.baseBackground,
      padding:  EdgeInsets.fromLTRB(8.aw, 8.ah, 8.aw, 16.aw),
      outerContent: const SizedBox.shrink(),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leadingIcon,
          8.sbW,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.h3Inter(
                  context,
                ).copyWith(fontWeight: FontWeight.w600),
              ),
              4.sbH,
              SizedBox(
                width: 220.aw,
                child: Text(
                  subtitle,
                  style: AppTextStyles.body2RegularInter(
                    context,
                  ).copyWith(color: AppColors.slateCharcoal60),
                ),
              ),
            ],
          ),
          10.sbW,
          AppSwitch(selected: enabled, onChanged: onEnabled),
        ],
      ),
    );
  }
}
