import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/widgets/textfield_outer_tile.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class SafetyBannerWidget extends StatelessWidget {
  const SafetyBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.ah, horizontal: 16.aw),
      decoration: BoxDecoration(
        color: AppColors.highlightCTAOrange.withOpacity(0.08),
        borderRadius: BorderRadius.circular(22.ar),
        border: Border(
          left: BorderSide(width: 4.aw, color: AppColors.highlightCTARed),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFieldOuterTile(
            leading: Icon(
              Icons.admin_panel_settings,
              size: 22.ar,
              color: AppColors.highlightCTARed,
            ),
            title: AppStrings.safetyFirst,
          ),
          8.sbH,
          Text(
            AppStrings.safetyFirstInfo,
            style: AppTextStyles.body2RegularInter(context).copyWith(
              color: AppColors.slateCharcoal80,
            ),
          ),
        ],
      ),
    );
  }
}
