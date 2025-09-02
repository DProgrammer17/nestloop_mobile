import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/services/app_storage.dart';
import 'package:nest_loop_mobile/features/taskboard/state/taskboard_vm.dart';
import 'package:nest_loop_mobile/network/api/base/base_error.dart';
import 'package:nest_loop_mobile/network/api/carer/response/care_provider_response.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/response/get_child_care_provider_response.dart';
import 'package:nest_loop_mobile/network/api/tasks/response/get_tasks_response.dart';
import 'package:nest_loop_mobile/network/api/tasks/task_api.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/task_statuses.dart';
import 'package:nest_loop_mobile/utils/enums/date_filter_options.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/task_categories.dart';
import 'package:nest_loop_mobile/utils/extensions/date_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_toast.dart';

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
    taskList: [
      GetTasksResponse(
        id: "task_001",
        parent: ParentInfo(id: "parent_001", fullName: "Jane Doe"),
        careProvider: CareProviderResponse(id: "cp_001", fullName: "Dr. Smith"),
        categories: [TaskCategories.medication],
        dateTime: DateTime.now().add(Duration(days: 1)),
        recurring: false,
        sendNotifications: true,
        title: "Doctor Appointment",
        description: "Annual physical check-up",
        location: "City Hospital",
        status: TaskStatus.pending,
        createdAt: DateTime.now(),
      ),
      GetTasksResponse(
        id: "task_002",
        parent: ParentInfo(id: "parent_002", fullName: "John Doe"),
        careProvider: CareProviderResponse(id: "cp_002", fullName: "Nurse Joy"),
        categories: [TaskCategories.therapy],
        dateTime: DateTime.now().add(Duration(days: 2)),
        recurring: true,
        sendNotifications: false,
        title: "Weekly Check-in",
        description: "Nurse visit for vitals monitoring",
        location: "Home",
        status: TaskStatus.completed,
        createdAt: DateTime.now().subtract(Duration(days: 1)),
      ),
      GetTasksResponse(
        id: "task_003",
        parent: ParentInfo(id: "parent_003", fullName: "Alice Green"),
        careProvider: CareProviderResponse(
          id: "cp_003",
          fullName: "Therapist Lee",
        ),
        categories: [TaskCategories.medication],
        dateTime: DateTime.now().add(Duration(days: 3)),
        recurring: false,
        sendNotifications: true,
        title: "Counseling Session",
        description: "Therapy for stress management",
        location: "Clinic Room 3",
        status: TaskStatus.pending,
        createdAt: DateTime.now(),
      ),
      GetTasksResponse(
        id: "task_004",
        parent: ParentInfo(id: "parent_001", fullName: "Jane Doe"),
        careProvider: CareProviderResponse(id: "cp_001", fullName: "Dr. Smith"),
        categories: [TaskCategories.appointment],
        dateTime: DateTime.now().add(Duration(days: 4)),
        recurring: false,
        sendNotifications: true,
        title: "Lab Results Review",
        description: "Discuss blood test results",
        location: "Hospital Lab",
        status: TaskStatus.pending,
        createdAt: DateTime.now(),
      ),
      GetTasksResponse(
        id: "task_004",
        parent: ParentInfo(id: "parent_001", fullName: "Jane Doe"),
        careProvider: CareProviderResponse(id: "cp_001", fullName: "Dr. Smith"),
        categories: [TaskCategories.appointment],
        dateTime: DateTime.now().add(Duration(days: 4)),
        recurring: false,
        sendNotifications: true,
        title: "Lab Results Review",
        description: "Discuss blood test results",
        location: "Hospital Lab",
        status: TaskStatus.pending,
        createdAt: DateTime.now(),
      ),
      GetTasksResponse(
        id: "task_004",
        parent: ParentInfo(id: "parent_001", fullName: "Jane Doe"),
        careProvider: CareProviderResponse(id: "cp_001", fullName: "Dr. Smith"),
        categories: [TaskCategories.appointment],
        dateTime: DateTime.now().add(Duration(days: 4)),
        recurring: false,
        sendNotifications: true,
        title: "Lab Results Review",
        description: "Discuss blood test results",
        location: "Hospital Lab",
        status: TaskStatus.pending,
        createdAt: DateTime.now(),
      ),
      GetTasksResponse(
        id: "task_004",
        parent: ParentInfo(id: "parent_001", fullName: "Jane Doe"),
        careProvider: CareProviderResponse(id: "cp_001", fullName: "Dr. Smith"),
        categories: [TaskCategories.appointment],
        dateTime: DateTime.now().add(Duration(days: 4)),
        recurring: false,
        sendNotifications: true,
        title: "Lab Results Review",
        description: "Discuss blood test results",
        location: "Hospital Lab",
        status: TaskStatus.pending,
        createdAt: DateTime.now(),
      ),
      GetTasksResponse(
        id: "task_004",
        parent: ParentInfo(id: "parent_001", fullName: "Jane Doe"),
        careProvider: CareProviderResponse(id: "cp_001", fullName: "Dr. Smith"),
        categories: [TaskCategories.appointment],
        dateTime: DateTime.now().add(Duration(days: 4)),
        recurring: false,
        sendNotifications: true,
        title: "Lab Results Review",
        description: "Discuss blood test results",
        location: "Hospital Lab",
        status: TaskStatus.pending,
        createdAt: DateTime.now(),
      ),
      GetTasksResponse(
        id: "task_004",
        parent: ParentInfo(id: "parent_001", fullName: "Jane Doe"),
        careProvider: CareProviderResponse(id: "cp_001", fullName: "Dr. Smith"),
        categories: [TaskCategories.appointment],
        dateTime: DateTime.now().add(Duration(days: 4)),
        recurring: false,
        sendNotifications: true,
        title: "Lab Results Review",
        description: "Discuss blood test results",
        location: "Hospital Lab",
        status: TaskStatus.pending,
        createdAt: DateTime.now(),
      ),
      GetTasksResponse(
        id: "task_004",
        parent: ParentInfo(id: "parent_001", fullName: "Jane Doe"),
        careProvider: CareProviderResponse(id: "cp_001", fullName: "Dr. Smith"),
        categories: [TaskCategories.appointment],
        dateTime: DateTime.now().add(Duration(days: 4)),
        recurring: false,
        sendNotifications: true,
        title: "Lab Results Review",
        description: "Discuss blood test results",
        location: "Hospital Lab",
        status: TaskStatus.pending,
        createdAt: DateTime.now(),
      ),
      GetTasksResponse(
        id: "task_005",
        parent: ParentInfo(id: "parent_004", fullName: "Michael Brown"),
        careProvider: CareProviderResponse(
          id: "cp_004",
          fullName: "Dr. Taylor",
        ),
        categories: [TaskCategories.appointment],
        dateTime: DateTime.now().add(Duration(days: 5)),
        recurring: false,
        sendNotifications: true,
        title: "Flu Shot",
        description: "Seasonal flu vaccination",
        location: "Community Health Center",
        status: TaskStatus.completed,
        completedAt: DateTime.now().subtract(Duration(days: 1)),
        createdAt: DateTime.now(),
      ),
      GetTasksResponse(
        id: "task_006",
        parent: ParentInfo(id: "parent_005", fullName: "Sarah White"),
        careProvider: CareProviderResponse(
          id: "cp_005",
          fullName: "Nurse Alex",
        ),
        categories: [TaskCategories.others],
        dateTime: DateTime.now().add(Duration(days: 6)),
        recurring: true,
        sendNotifications: false,
        title: "Bi-weekly Visit",
        description: "Routine blood pressure monitoring",
        location: "Home",
        status: TaskStatus.pending,
        createdAt: DateTime.now(),
      ),
      GetTasksResponse(
        id: "task_007",
        parent: ParentInfo(id: "parent_006", fullName: "David Johnson"),
        careProvider: CareProviderResponse(
          id: "cp_006",
          fullName: "Dr. Wilson",
        ),
        categories: [TaskCategories.others],
        dateTime: DateTime.now().add(Duration(days: 7)),
        recurring: false,
        sendNotifications: true,
        title: "Specialist Consultation",
        description: "Consultation with cardiologist",
        location: "City Cardiology Center",
        status: TaskStatus.pending,
        createdAt: DateTime.now(),
      ),
      GetTasksResponse(
        id: "task_008",
        parent: ParentInfo(id: "parent_007", fullName: "Emily Davis"),
        careProvider: CareProviderResponse(
          id: "cp_007",
          fullName: "Dr. Parker",
        ),
        categories: [TaskCategories.therapy],
        dateTime: DateTime.now().add(Duration(days: 8)),
        recurring: false,
        sendNotifications: true,
        title: "Minor Surgery",
        description: "Surgical removal of cyst",
        location: "General Hospital",
        status: TaskStatus.completed,
        createdAt: DateTime.now(),
      ),
      GetTasksResponse(
        id: "task_009",
        parent: ParentInfo(id: "parent_008", fullName: "Olivia Clark"),
        careProvider: CareProviderResponse(id: "cp_008", fullName: "Dr. Adams"),
        categories: [TaskCategories.therapy],
        dateTime: DateTime.now().add(Duration(days: 9)),
        recurring: true,
        sendNotifications: false,
        title: "Diet Consultation",
        description: "Nutrition plan update",
        location: "Wellness Center",
        status: TaskStatus.pending,
        createdAt: DateTime.now(),
      ),
      GetTasksResponse(
        id: "task_010",
        parent: ParentInfo(id: "parent_009", fullName: "Chris Evans"),
        careProvider: CareProviderResponse(id: "cp_009", fullName: "Nurse Mia"),
        categories: [TaskCategories.others],
        dateTime: DateTime.now().add(Duration(days: 10)),
        recurring: false,
        sendNotifications: true,
        title: "Rehab Session",
        description: "Post-surgery physiotherapy",
        location: "Rehab Center",
        status: TaskStatus.completed,
        completedAt: DateTime.now().subtract(Duration(hours: 2)),
        createdAt: DateTime.now(),
      ),
    ],
  );

  void updatePage(int page) => state = state.copyWith(currentTabPage: page);

  void updateTaskCategory(TaskCategories category) =>
      state = state.copyWith(selectedTaskCategory: category);

  void selectorFilterOption(DateFilterOptions options) =>
      state = state.copyWith(filterOptions: options);

  void updateCalenderTaskCategory(TaskCategories category) =>
      state = state.copyWith(selectedCalenderTaskCategory: category);

  void updateCalenderDate(DateTime day) =>
      state = state.copyWith(selectedCalenderDay: () => day);

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

  List<DateTime> get calendarDays {
    final currentMonth = state.currentFilter ?? DateTime.now();
    final firstDay = DateTime(currentMonth.year, currentMonth.month, 1);
    final startOfWeek = firstDay.subtract(Duration(days: firstDay.weekday % 7));

    List<DateTime> days = [];

    // Generate 42 days (6 weeks) starting from the week beginning
    for (int i = 0; i < 42; i++) {
      days.add(startOfWeek.addDays(i));
    }

    return days;
  }

  Future<void> getTasks(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final authToken = await AppStorage.getStringPref(ConfigStrings.authToken);

    try {
      final response = await TaskApi.getTasks(authToken: authToken);

      state = state.copyWith(isLoading: false, taskList: response.data ?? []);
    } on BaseError catch (e) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(
          context: context,
          message: e.message.toString(),
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(context: context, message: e.toString());
      }
    }
    return;
  }

  List<GetTasksResponse> getDaysTasks(DateTime day) {
    final daysList = state.taskList
        .where((e) => e.dateTime!.dayMonthYearFormat == day.dayMonthYearFormat)
        .toList();
    return daysList;
  }
}
