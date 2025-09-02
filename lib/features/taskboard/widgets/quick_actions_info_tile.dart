import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class QuickActionsInfoTile extends StatelessWidget {
  final Widget actionIcon;
  final String title;
  final VoidCallback onTap;
  const QuickActionsInfoTile({
    super.key,
    required this.actionIcon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.ah),
      width: 114.aw,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.baseBackground,
        borderRadius: BorderRadius.circular(12.ar),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          actionIcon,
          4.sbH,
          Text(
            title,
            style: AppTextStyles.body1RegularInter(context).copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.slateCharcoalMain,
            ),
          ),
        ],
      ),
    );
  }
}
