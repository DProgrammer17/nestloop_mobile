import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class DetailTile extends StatelessWidget {
  final Widget leading;
  final String info;
  final String title;
  const DetailTile({
    super.key,
    required this.leading,
    required this.info,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        leading,
        12.sbW,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              info,
              style: AppTextStyles.body1RegularInter(
                context,
              ).copyWith(color: AppColors.slateCharcoal80),
            ),
            4.sbH,
            Text(
              title,
              style: AppTextStyles.body2RegularInter(context).copyWith(
                color: AppColors.slateCharcoalMain,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
