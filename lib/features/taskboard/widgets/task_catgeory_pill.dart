import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/task_categories.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class TaskCategoryPill extends StatelessWidget {
  final TaskCategories category;
  const TaskCategoryPill({super.key, required this.category});

  Widget categoryIcon() {
    switch (category) {
      case TaskCategories.medication:
        return SvgPicture.asset(SvgAssets.medicationIcon, height: 12.ah);

      case TaskCategories.therapy:
        return SvgPicture.asset(SvgAssets.therapyIcon, height: 12.ah);

      case TaskCategories.appointment:
        return SvgPicture.asset(SvgAssets.appointmentIcon, height: 12.ah);

      case TaskCategories.others:
        return SvgPicture.asset(SvgAssets.otherIcon, height: 12.ah);

      case TaskCategories.none:
      case TaskCategories.all:
        return SvgPicture.asset(SvgAssets.medicationIcon, height: 12.ah);
    }
  }

  Color categoryColor() {
    switch (category) {
      case TaskCategories.medication:
        return AppColors.basePlum;

      case TaskCategories.therapy:
        return AppColors.indigo;

      case TaskCategories.appointment:
        return AppColors.onlineGreen;

      case TaskCategories.others:
        return AppColors.violet;

      case TaskCategories.none:
      case TaskCategories.all:
        return AppColors.basePlum;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.ah, horizontal: 10.aw),
      decoration: BoxDecoration(
        border: Border.all(width: 1.aw, color: AppColors.baseBackground),
        borderRadius: BorderRadius.circular(40.ar),
        color: categoryColor().withOpacity(0.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          categoryIcon(),
          5.75.sbW,
          Text(
            category.displayString,
            style: AppTextStyles.body3RegularInter(
              context,
            ).copyWith(fontWeight: FontWeight.w700, color: categoryColor(),),
          ),
        ],
      ),
    );
  }
}
