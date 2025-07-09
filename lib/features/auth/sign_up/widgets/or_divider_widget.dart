import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: AppConstants.deviceWidth * 0.4,
          child: Divider(thickness: 1.aw, color: AppColors.slateCharcoal06),
        ),
        12.sbW,
        Text(
          AppStrings.orCaps,
          style: AppTextStyles.body1RegularInter(
            context,
          ).copyWith(color: AppColors.slateCharcoal60),
        ),
        12.sbW,
        SizedBox(
          width: AppConstants.deviceWidth * 0.4,
          child: Divider(thickness: 1.aw, color: AppColors.slateCharcoal06),
        ),
      ],
    );
  }
}
