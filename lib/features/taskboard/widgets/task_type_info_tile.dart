import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/task_categories.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class TaskTypeInfoTile extends StatelessWidget {
  final TaskCategories categories;
  final TaskCategories selectedCategory;
  final ValueChanged<TaskCategories> onSelected;
  const TaskTypeInfoTile({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelected,
  });

  bool get selected => categories == selectedCategory;
  Color get color =>
      selected ? AppColors.slateCharcoalMain : AppColors.slateCharcoal40;

  Widget icon() {
    switch (categories) {
      case TaskCategories.all:
        return Icon(Symbols.grid_view, size: 22.ar, color: color);

      case TaskCategories.medication:
        return Icon(Symbols.pill, size: 22.ar, color: color);

      case TaskCategories.therapy:
        return Icon(Symbols.psychiatry, size: 22.ar, color: color);

      case TaskCategories.appointment:
        return Icon(Symbols.calendar_month, size: 22.ar, color: color);

      case TaskCategories.others:
      case TaskCategories.none:
        return Icon(Symbols.kid_star, size: 22.ar, color: color);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onSelected.call(categories),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.aw),
        child: Column(
          children: [
            16.sbH,
            icon(),
            4.sbH,
            Text(
              categories.displayString,
              style: AppTextStyles.body1RegularInter(
                context,
              ).copyWith(color: color),
            ),
            16.sbH,
            if(selected)...[
              Container(
                height: 3.ah,
                width: 40.aw,
                color: AppColors.slateCharcoalMain,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
