import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/taskboard/state/taskboard_notifier.dart';
import 'package:nest_loop_mobile/features/taskboard/widgets/day_container.dart';
import 'package:nest_loop_mobile/features/taskboard/widgets/day_info_widget.dart';
import 'package:nest_loop_mobile/features/taskboard/widgets/task_type_info_tile.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/task_categories.dart';

class TaskCalender extends ConsumerWidget {
  const TaskCalender({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.ar),
        color: AppColors.baseBackground,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: List.generate(
                TaskCategories.values
                    .where((e) => e != TaskCategories.none)
                    .length,
                (index) => Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 5.aw : 0),
                  child: TaskTypeInfoTile(
                    categories: TaskCategories.values.elementAt(index),
                    selectedCategory: ref
                        .watch(taskBoardNotifier)
                        .selectedCalenderTaskCategory,
                    onSelected: (category) => ref
                        .watch(taskBoardNotifier.notifier)
                        .updateCalenderTaskCategory(category),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                AppStrings.weekdaysNames.length,
                (index) => DayContainer(
                  alignment: Alignment.center,
                  content: Text(
                    AppStrings.weekdaysNames.elementAt(index),
                    style: AppTextStyles.body1RegularInter(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.slateCharcoal60,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppConstants.deviceHeight * 0.58,
              width: AppConstants.deviceWidth + 18.aw,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                    childAspectRatio: 0.7,
                ),
                itemCount: ref
                    .watch(taskBoardNotifier.notifier)
                    .calendarDays
                    .length,
                itemBuilder: (_, index) {
                  return DayContainer(
                  alignment: Alignment.topCenter,
                  content: DayInfoWidget(
                    day: ref
                        .watch(taskBoardNotifier.notifier)
                        .calendarDays
                        .elementAt(index),
                    selectedDay: ref.watch(taskBoardNotifier).selectedCalenderDay ?? DateTime.now(),
                    tasks: ref.watch(taskBoardNotifier.notifier).getDaysTasks(ref
                        .watch(taskBoardNotifier.notifier)
                        .calendarDays
                        .elementAt(index)),
                    onSelected: (day)=> ref.watch(taskBoardNotifier.notifier).updateCalenderDate(day),
                  ),
                );}
              ),
            ),
          ],
        ),
      ),
    );
  }
}
