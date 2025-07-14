import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/utils/enums/medical_category.dart';
import 'package:nest_loop_mobile/utils/extensions/string_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class MedicalInfoTile extends StatelessWidget {
  final MedicalCategory category;
  final String info;
  const MedicalInfoTile({
    super.key,
    required this.category,
    required this.info,
  });

  Widget tileIcon() {
    switch (category) {
      case MedicalCategory.diagnosis:
        return SvgPicture.asset(
          SvgAssets.diagnosisIcon,
          height: 23.ah,
          color: AppColors.slateCharcoal40,
        );

      case MedicalCategory.allergies:
        return SvgPicture.asset(
          SvgAssets.allergiesIcon,
          height: 23.ah,
          color: AppColors.slateCharcoal40,
        );

      case MedicalCategory.triggers:
        return SvgPicture.asset(
          SvgAssets.triggersIcon,
          height: 18.ah,
          color: AppColors.slateCharcoal40,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108.67.aw,
      padding: EdgeInsets.symmetric(vertical: 16.ah, horizontal: 12.aw),
      decoration: BoxDecoration(
        color: AppColors.neutralWhite,
        borderRadius: BorderRadius.circular(24.ar),
      ),
      child: Column(
        children: [
          tileIcon(),
          if (category == MedicalCategory.allergies ||
              category == MedicalCategory.diagnosis) ...[
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '+${category == MedicalCategory.diagnosis ? 3.toString() : 1.toString()}',
                style: AppTextStyles.body2RegularInter(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.secondaryPop,
                ),
              ),
            ),
          ],
          if (category == MedicalCategory.triggers) ...[20.sbH],
          Text(
            '$info,',
            style: AppTextStyles.body1RegularInter(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          3.sbH,
          Text(
            category.name.toCamelCase,
            style: AppTextStyles.body2RegularInter(context).copyWith(
              fontSize: 13.asp,
              color: AppColors.slateCharcoal40,
            ),
          ),
        ],
      ),
    );
  }
}
