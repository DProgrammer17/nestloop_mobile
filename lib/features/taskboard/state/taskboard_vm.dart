import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/response/get_child_care_provider_response.dart';
import 'package:nest_loop_mobile/network/api/tasks/response/get_tasks_response.dart';
import 'package:nest_loop_mobile/utils/enums/date_filter_options.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/task_categories.dart';

class TaskBoardVM {
  final bool isLoading;
  final int currentTabPage;
  final DateFilterOptions filterOptions;
  final List<DateFilterOptions> filterList;
  final DateTime? currentFilter;
  final DateTime? selectedCalenderDay;
  final TextEditingController taskNameController;
  final TextEditingController scheduleDayController;
  final TextEditingController scheduleTimeController;
  final TextEditingController scheduleAddressController;
  final TextEditingController taskNotesController;
  final ChildCareProviderResponse? assignedCareProvider;
  final TaskCategories selectedTaskCategory;
  final TaskCategories selectedCalenderTaskCategory;
  final String assignedCareProviderName;
  final List<GetTasksResponse> taskList;

  const TaskBoardVM({
    required this.taskNameController,
    required this.scheduleDayController,
    required this.scheduleTimeController,
    required this.scheduleAddressController,
    required this.taskNotesController,
    this.isLoading = false,
    this.currentTabPage = 0,
    this.filterOptions = DateFilterOptions.month,
    this.currentFilter,
    this.selectedCalenderDay,
    this.filterList = const [
      DateFilterOptions.day,
      DateFilterOptions.month,
      DateFilterOptions.week,
    ],
    this.taskList = const[],
    this.assignedCareProvider,
    this.assignedCareProviderName = AppStrings.selectCareGiver,
    this.selectedTaskCategory = TaskCategories.none,
    this.selectedCalenderTaskCategory = TaskCategories.none,
  });

  TaskBoardVM copyWith({
    bool? isLoading,
    int? currentTabPage,
    DateFilterOptions? filterOptions,
    DateTime? Function()? currentFilter,
    DateTime? Function()? selectedCalenderDay,
    List<DateFilterOptions>? filterList,
    TextEditingController? taskNameController,
    TextEditingController? scheduleDayController,
    TextEditingController? scheduleTimeController,
    TextEditingController? scheduleAddressController,
    TextEditingController? taskNotesController,
    ChildCareProviderResponse? Function()? assignedCareProvider,
    String? assignedCareProviderName,
    TaskCategories? selectedTaskCategory,
    TaskCategories? selectedCalenderTaskCategory,
    List<GetTasksResponse>? taskList,
  }) {
    return TaskBoardVM(
      isLoading: isLoading ?? this.isLoading,
      currentTabPage: currentTabPage ?? this.currentTabPage,
      filterOptions: filterOptions ?? this.filterOptions,
      filterList: filterList ?? this.filterList,
      currentFilter: currentFilter != null
          ? currentFilter()
          : this.currentFilter,
      selectedCalenderDay: selectedCalenderDay != null
          ? selectedCalenderDay()
          : this.selectedCalenderDay,
      assignedCareProvider: assignedCareProvider != null
          ? assignedCareProvider()
          : this.assignedCareProvider,
      assignedCareProviderName: assignedCareProviderName ?? this.assignedCareProviderName,
      taskNameController: taskNameController ?? this.taskNameController,
      scheduleDayController:
          scheduleDayController ?? this.scheduleDayController,
      scheduleTimeController:
          scheduleTimeController ?? this.scheduleTimeController,
      scheduleAddressController:
          scheduleAddressController ?? this.scheduleAddressController,
      taskNotesController: taskNotesController ?? this.taskNotesController,
      selectedTaskCategory: selectedTaskCategory ?? this.selectedTaskCategory,
      selectedCalenderTaskCategory: selectedCalenderTaskCategory ?? this.selectedCalenderTaskCategory,
      taskList: taskList ?? this.taskList,
    );
  }
}
