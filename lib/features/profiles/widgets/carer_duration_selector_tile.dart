import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/utils/enums/access_duration.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class CarerDurationSelectorTile extends StatelessWidget {
  final AccessDuration selectedDuration;
  final AccessDuration durationType;
  final Widget? leading;
  final IconData? leadingIcon;
  final double? iconSize;
  final String title;
  final String subtitle;
  final ValueChanged onTap;
  const CarerDurationSelectorTile({
    super.key,
    required this.selectedDuration,
    required this.durationType,
    this.leading,
    this.leadingIcon,
    this.iconSize,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onTap.call(durationType),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.ah, horizontal: 16.aw),
        decoration: BoxDecoration(
          color: AppColors.baseBackground,
          borderRadius: BorderRadius.circular(16.ar),
          border: Border.all(
            width: 1.aw,
            color: selectedDuration == durationType
                ? AppColors.primaryOrange
                : Colors.transparent,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leading ??
                Icon(
                  leadingIcon!,
                  size: iconSize ?? 24.ar,
                  color: selectedDuration == durationType
                      ? AppColors.slateCharcoalMain
                      : AppColors.slateCharcoal40,
                ),
            16.sbH,
            SizedBox(
              width: 126.aw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.body2RegularInter(context).copyWith(
                      fontWeight: FontWeight.w500,
                      color: selectedDuration == durationType
                          ? AppColors.slateCharcoalMain
                          : AppColors.slateCharcoal80,
                    ),
                  ),
                  8.sbH,
                  Text(
                    subtitle,
                    style: AppTextStyles.body2RegularInter(
                      context,
                    ).copyWith(color: AppColors.slateCharcoal60),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
