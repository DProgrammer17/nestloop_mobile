import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class InfoTile extends StatelessWidget {
  final Widget? headerIcon;
  final String? headerTitle;
  final Widget? headerContent;
  final String? info;
  final Widget? infoContent;
  final CrossAxisAlignment? alignment;
  const InfoTile({
    super.key,
    this.headerIcon,
    this.headerTitle,
    this.headerContent,
    this.info,
    this.infoContent,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: alignment ?? CrossAxisAlignment.center,
        children: [
          headerContent ??
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  headerIcon!,
                  8.sbW,
                  Text(
                    headerTitle!,
                    style: AppTextStyles.body2RegularInter(
                      context,
                    ).copyWith(color: AppColors.slateCharcoal60),
                  ),
                ],
              ),

          infoContent ?? Text(
            info!,
            style: AppTextStyles.h2Inter(context),
          ),
        ],
      ),
    );
  }
}
