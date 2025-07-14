import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/access_levels.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class CareAccessInfoTile extends StatelessWidget {
  final AccessLevels accessLevel;
  const CareAccessInfoTile({super.key, required this.accessLevel});

  String infoHeader() {
    switch (accessLevel) {
      case AccessLevels.editAccess:
        return AppStrings.limitEditAccess;

      case AccessLevels.viewAccess:
        return AppStrings.viewOnlyAccess;

      case AccessLevels.noAccess:
        return AppStrings.noAccess;

      case AccessLevels.none:
        return AppStrings.noAccess;
    }
  }

  String infoSubText() {
    switch (accessLevel) {
      case AccessLevels.editAccess:
        return AppStrings.viewSpecificInfoAndEdit;

      case AccessLevels.viewAccess:
        return AppStrings.viewSpecificInfo;

      case AccessLevels.noAccess:
        return AppStrings.noAccess;

      case AccessLevels.none:
        return AppStrings.noAccess;
    }
  }

  Widget infoIcon() {
    switch (accessLevel) {
      case AccessLevels.editAccess:
        return Icon(
          Icons.mode_edit_outlined,
          size: 24.ar,
          color: AppColors.slateCharcoal80,
        );

      case AccessLevels.viewAccess:
        return Icon(
          Icons.visibility_outlined,
          size: 24.ar,
          color: AppColors.slateCharcoal80,
        );

      case AccessLevels.noAccess:
        return Icon(Icons.block, size: 24.ar, color: AppColors.slateCharcoal80);

      case AccessLevels.none:
        return Icon(Icons.block, size: 24.ar, color: AppColors.slateCharcoal80);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.ah, horizontal: 14.aw),
      decoration: BoxDecoration(
        color: AppColors.baseBackground,
        borderRadius: BorderRadius.circular(16.ar),
        border: Border(
          top: BorderSide(width: 1.aw, color: AppColors.pastelGreen),
          bottom: BorderSide(width: 1.aw, color: AppColors.pastelGreen),
          left: BorderSide(width: 4.aw, color: AppColors.pastelGreen),
          right: BorderSide(width: 1.aw, color: AppColors.pastelGreen),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          infoIcon(),
          16.sbW,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                infoHeader(),
                style: AppTextStyles.h3Inter(
                  context,
                ).copyWith(fontWeight: FontWeight.w500),
              ),
              6.sbH,
              Text(
                infoSubText(),
                style: AppTextStyles.body2RegularInter(
                  context,
                ).copyWith(color: AppColors.slateCharcoal60),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
