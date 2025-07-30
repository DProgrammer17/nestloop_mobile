import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/response/get_child_care_provider_response.dart';
import 'package:nest_loop_mobile/utils/enums/date_filter_options.dart';

class TaskBoardVM {
  final bool isLoading;
  final int currentTabPage;
  final DateFilterOptions filterOptions;
  final List<DateFilterOptions> filterList;
  final DateTime? currentFilter;
  final TextEditingController taskNameController;
  final TextEditingController scheduleDayController;
  final TextEditingController scheduleTimeController;
  final TextEditingController scheduleAddressController;
  final TextEditingController taskNotesController;
  final ChildCareProviderResponse? assignedCareProvider;

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
    this.filterList = const [
      DateFilterOptions.day,
      DateFilterOptions.month,
      DateFilterOptions.week,
    ],
    this.assignedCareProvider,
  });

  TaskBoardVM copyWith({
    bool? isLoading,
    int? currentTabPage,
    DateFilterOptions? filterOptions,
    DateTime? Function()? currentFilter,
    List<DateFilterOptions>? filterList,
    TextEditingController? taskNameController,
    TextEditingController? scheduleDayController,
    TextEditingController? scheduleTimeController,
    TextEditingController? scheduleAddressController,
    TextEditingController? taskNotesController,
    ChildCareProviderResponse? Function()? assignedCareProvider,
  }) {
    return TaskBoardVM(
      isLoading: isLoading ?? this.isLoading,
      currentTabPage: currentTabPage ?? this.currentTabPage,
      filterOptions: filterOptions ?? this.filterOptions,
      filterList: filterList ?? this.filterList,
      currentFilter: currentFilter != null
          ? currentFilter()
          : this.currentFilter,
      assignedCareProvider: assignedCareProvider != null
          ? assignedCareProvider()
          : this.assignedCareProvider,
      taskNameController: taskNameController ?? this.taskNameController,
      scheduleDayController:
          scheduleDayController ?? this.scheduleDayController,
      scheduleTimeController:
          scheduleTimeController ?? this.scheduleTimeController,
      scheduleAddressController:
          scheduleAddressController ?? this.scheduleAddressController,
      taskNotesController: taskNotesController ?? this.taskNotesController,
    );
  }
}
