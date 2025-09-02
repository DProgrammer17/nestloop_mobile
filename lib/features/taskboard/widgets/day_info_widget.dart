import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/taskboard/state/taskboard_notifier.dart';
import 'package:nest_loop_mobile/features/taskboard/widgets/task_indicator_line.dart';
import 'package:nest_loop_mobile/network/api/tasks/response/get_tasks_response.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/task_categories.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class DayInfoWidget extends ConsumerWidget {
  final DateTime day;
  final DateTime selectedDay;
  final List<GetTasksResponse> tasks;
  final ValueChanged<DateTime> onSelected;
  const DayInfoWidget({
    super.key,
    required this.day,
    required this.selectedDay,
    required this.tasks,
    required this.onSelected,
  });

  bool get selected => day == selectedDay;
  bool get unselectedMultipleTask => tasks.length > 3 && !selected;
  bool get selectedMultipleTask => tasks.length > 3 && selected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool otherMonth = day.month != (ref.watch(taskBoardNotifier).currentFilter?.month ?? DateTime.now().month);
    return InkWell(
      onTap: ()=> onSelected.call(day),
      child: Opacity(
        opacity: otherMonth ? 0.8 : 1,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 4.ah),
          padding: EdgeInsets.fromLTRB(8.aw, 8.ah, 8.aw, 7.ah),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.ar),
            color: selected ? AppColors.slateCharcoalMain : Colors.transparent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              2.sbH,
              Text(
                day.day.toString(),
                style: AppTextStyles.body1RegularInter(context).copyWith(
                  color: otherMonth
                      ? AppColors.slateCharcoal20
                      : selected ? AppColors.baseBackground : AppColors.slateCharcoal80,
                  fontWeight: otherMonth ? FontWeight.w400 : FontWeight.w700,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2.aw, vertical: 2.ah),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.ar),
                  color: selectedMultipleTask
                      ? AppColors.baseBackground
                      : unselectedMultipleTask
                      ? AppColors.slateCharcoalMain
                      : Colors.transparent,
                ),
                child: Column(
                  children: [
                    4.sbH,
                    Column(
                      spacing: 2.ah,
                      children: List.generate(
                        tasks.length > 3 ? 3 : tasks.length,
                        (index) => TaskIndicatorLine(
                          category:
                              tasks.elementAt(index).categories?.first ??
                              TaskCategories.none,
                        ),
                      ),
                    ),
                    if (tasks.length > 3) ...[
                      4.sbH,
                      Text(
                        '+${(tasks.length - 3).toString()}',
                        style: AppTextStyles.body1RegularInter(context).copyWith(
                          color: selectedMultipleTask
                              ? AppColors.slateCharcoalMain
                              : AppColors.baseBackground,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
