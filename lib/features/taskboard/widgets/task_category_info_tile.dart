import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/task_categories.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class TaskCategoryInfoTile extends StatelessWidget {
  final Widget leadingIcon;
  final Color tileColor;
  final TaskCategories title;
  final String subtitle;
  final TaskCategories selectedCategory;
  final ValueChanged<TaskCategories> onSelected;
  const TaskCategoryInfoTile({
    super.key,
    required this.leadingIcon,
    required this.tileColor,
    required this.title,
    required this.subtitle,
    required this.selectedCategory,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onSelected.call(title),
      child: Container(
        width: 173.aw,
        padding: EdgeInsets.symmetric(vertical: 12.ah, horizontal: 6.aw),
        decoration: BoxDecoration(
          color: AppColors.baseBackground,
          borderRadius: BorderRadius.circular(16.ar),
          border: Border.all(width: 1.aw, color: selectedCategory == title ? tileColor : AppColors.baseBackground,),
        ),
        child: Row(
          children: [
            Container(
              height: 40.ah,
              width: 40.aw,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.ar),
                color: tileColor.withOpacity(0.3),
              ),
              child: leadingIcon,
            ),
            12.sbW,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.displayString,
                  style: AppTextStyles.body2RegularInter(
                    context,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
                2.sbH,
                SizedBox(
                  width: 100.aw,
                  child: Text(
                    subtitle,
                    style: AppTextStyles.body1RegularInter(
                      context,
                    ).copyWith(color: AppColors.slateCharcoal60),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
