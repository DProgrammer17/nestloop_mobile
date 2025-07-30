import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/features/taskboard/state/taskboard_vm.dart';
import 'package:nest_loop_mobile/utils/enums/date_filter_options.dart';
import 'package:nest_loop_mobile/utils/extensions/date_extensions.dart';

final taskBoardNotifier = NotifierProvider<TaskBoardNotifier, TaskBoardVM>(() {
  return TaskBoardNotifier();
});

class TaskBoardNotifier extends Notifier<TaskBoardVM> {
  @override
  TaskBoardVM build() => TaskBoardVM(
    taskNameController: TextEditingController(),
    scheduleDayController: TextEditingController(),
    scheduleTimeController: TextEditingController(),
    scheduleAddressController: TextEditingController(),
    taskNotesController: TextEditingController(),
  );

  void updatePage(int page) => state = state.copyWith(currentTabPage: page);

  void selectorFilterOption(DateFilterOptions options)=> state = state.copyWith(filterOptions: options);

  void setFilterDate({bool now = false, bool add = false, bool minus = false}) {
    ///Set current date as the filter option
    if (now) {
      state = state.copyWith(currentFilter: DateTime.now);
      return;
    }

    DateTime editTime = state.currentFilter ?? DateTime.now();

    ///Add to the date based on the filter option
    if (add) {
      switch (state.filterOptions) {
        case DateFilterOptions.day:
          editTime = editTime.addDays(1);
          break;

        case DateFilterOptions.week:
          editTime = editTime.addWeeks(1);
          break;

        case DateFilterOptions.month:
          editTime = editTime.addMonths(1);
          break;

        case DateFilterOptions.none:
          editTime = editTime = DateTime.now();
          break;
      }
    }

    ///Minus to the date based on the filter option
    if (minus) {
      switch (state.filterOptions) {
        case DateFilterOptions.day:
          editTime = editTime.subtractDays(1);
          break;

        case DateFilterOptions.week:
          editTime = editTime.subtractWeeks(1);
          break;

        case DateFilterOptions.month:
          editTime = editTime.subtractMonths(1);
          break;

        case DateFilterOptions.none:
          editTime = editTime = DateTime.now();
          break;
      }
    }
    state = state.copyWith(currentFilter: () => editTime);
    return;
  }

  String returnDateString(DateTime time) {
    ///Return string date based on the filter option
    switch (state.filterOptions) {
      case DateFilterOptions.day || DateFilterOptions.week:
        return time.dayMonthYearFormat;

      case DateFilterOptions.month || DateFilterOptions.none:
        return time.monthYearFormat;
    }
  }
}
