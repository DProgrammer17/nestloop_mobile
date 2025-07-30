import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/taskboard/state/taskboard_notifier.dart';
import 'package:nest_loop_mobile/features/taskboard/widgets/empty_task_list_widget.dart';
import 'package:nest_loop_mobile/utils/enums/date_filter_options.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/tiles/selector_tab_tile.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class TaskDateSelectionWidget extends ConsumerStatefulWidget {
  const TaskDateSelectionWidget({super.key});

  @override
  ConsumerState<TaskDateSelectionWidget> createState() =>
      _TaskDateSelectionWidgetState();
}

class _TaskDateSelectionWidgetState
    extends ConsumerState<TaskDateSelectionWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(taskBoardNotifier.notifier).setFilterDate(now: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WidgetCasing(
      padding: EdgeInsets.symmetric(vertical: 6.ah, horizontal: 6.aw),
      outerContentPadding: 0,
      outerContent: WidgetCasing(
        backgroundColor: AppColors.baseBackground,
        borderRadius: 18.ar,
        padding: EdgeInsets.fromLTRB(16.aw, 0.ah, 16.aw, 8.ah),
        outerContent: const SizedBox.shrink(),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ref
                  .watch(taskBoardNotifier.notifier)
                  .returnDateString(
                    ref.watch(taskBoardNotifier).currentFilter ??
                        DateTime.now(),
                  ),
              style: AppTextStyles.h3Inter(context).copyWith(fontSize: 17.asp),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8.ah,
              children: [
                InkWell(
                  onTap: () => ref
                      .watch(taskBoardNotifier.notifier)
                      .setFilterDate(minus: true),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.ah,
                      horizontal: 14.aw,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.ar),
                      color: AppColors.slateCharcoal06,
                    ),
                    child: Icon(
                      CupertinoIcons.chevron_left,
                      size: 15.ar,
                      color: AppColors.slateCharcoalMain,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => ref
                      .watch(taskBoardNotifier.notifier)
                      .setFilterDate(add: true),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.ah,
                      horizontal: 14.aw,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.ar),
                      color: AppColors.slateCharcoal06,
                    ),
                    child: Icon(
                      CupertinoIcons.chevron_right,
                      size: 15.ar,
                      color: AppColors.slateCharcoalMain,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      content: Column(
        children: [
          EmptyTakListWidget(),
          SelectorTabTile(
            indicatorPadding: EdgeInsets.symmetric(
              vertical: 10.ah,
              horizontal: 38.83.aw,
            ),
            selectedValue: ref
                .watch(taskBoardNotifier)
                .filterOptions
                .displayString,
            options: ref
                .watch(taskBoardNotifier)
                .filterList
                .map((e) => e.displayString)
                .toList(),
            onTap: (value) => ref
                .watch(taskBoardNotifier.notifier)
                .selectorFilterOption(value.displayDateFilterOptions!),
          ),
        ],
      ),
    );
  }
}
