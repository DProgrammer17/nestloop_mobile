import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/task_categories.dart';

class TaskIndicatorLine extends StatelessWidget{
  final TaskCategories category;
  const TaskIndicatorLine({super.key, required this.category});

  Color indicatorColor(){
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
      width: 20.aw,
      height: 4.ah,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.ar),
        color: indicatorColor(),
      ),
    );
  }

}