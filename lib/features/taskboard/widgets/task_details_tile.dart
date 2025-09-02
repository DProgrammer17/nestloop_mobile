import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/taskboard/ui/task_details_page.dart';
import 'package:nest_loop_mobile/features/taskboard/widgets/task_catgeory_pill.dart';
import 'package:nest_loop_mobile/network/api/tasks/response/get_tasks_response.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/task_categories.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/utils/extensions/string_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_network_image.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_switch.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/tiles/time_pill.dart';

class TaskDetailsTile extends StatefulWidget {
  final GetTasksResponse taskInfo;
  const TaskDetailsTile({super.key, required this.taskInfo});

  @override
  State<TaskDetailsTile> createState() => _TaskDetailsTileState();
}

class _TaskDetailsTileState extends State<TaskDetailsTile> {
  ValueNotifier<bool> completed = ValueNotifier(false);
  ValueNotifier<bool> repeat = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.ah, horizontal: 16.aw),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.ar),
        color: AppColors.baseBackground,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TimePill(
                    time: (widget.taskInfo.dateTime ?? DateTime.now())
                        .toIso8601String()
                        .dateTo12HourFormat(),
                  ),
                  8.sbH,
                  ValueListenableBuilder(
                    valueListenable: completed,
                    builder: (_, comp, _) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () => completed.value = !completed.value,
                            child: Icon(
                              comp
                                  ? Icons.check_box_rounded
                                  : Icons.check_box_outline_blank_rounded,
                              size: 22.ar,
                              color: comp
                                  ? AppColors.pastelGreen
                                  : AppColors.slateCharcoal40,
                            ),
                          ),
                          9.sbW,
                          Text(
                            widget.taskInfo.title ?? 'N/A',
                            style: AppTextStyles.body4RegularInter(context)
                                .copyWith(
                                  color: AppColors.slateCharcoal80,
                                  decoration: completed.value
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              InkWell(
                onTap: () =>
                    context.pushSuper(TaskDetailsPage(task: widget.taskInfo)),
                child: Container(
                  height: 48.ah,
                  width: 48.aw,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.slateCharcoal06,
                  ),
                  child: Icon(
                    Icons.more_vert_rounded,
                    size: 22.ar,
                    color: AppColors.slateCharcoalMain,
                  ),
                ),
              ),
            ],
          ),
          12.sbH,
          TaskCategoryPill(
            category: widget.taskInfo.categories?.first ?? TaskCategories.none,
          ),
          16.sbH,
          Divider(thickness: 1.aw, color: AppColors.slateCharcoal06),
          16.sbH,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppNetworkImage(
                    image: widget.taskInfo.careProvider?.avatar ?? '',
                    height: 32.ah,
                    width: 32.aw,
                    shape: BoxShape.circle,
                  ),
                  12.sbW,
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 120.aw),
                    child: Text(
                      widget.taskInfo.parent?.fullName ??
                          widget.taskInfo.careProvider?.fullName ??
                          '',
                      style: AppTextStyles.h3Inter(context),
                    ),
                  ),
                  5.sbW,
                  Icon(
                    Icons.verified_sharp,
                    size: 16.ar,
                    color: AppColors.baseBlue,
                  ),
                ],
              ),
              ValueListenableBuilder(
                valueListenable: repeat,
                builder: (_, rep, _) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppStrings.repeat,
                        style: AppTextStyles.body2RegularInter(context),
                      ),
                      11.sbW,
                      AppSwitch(
                        selected: rep,
                        onChanged: (value) => repeat.value = value,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
