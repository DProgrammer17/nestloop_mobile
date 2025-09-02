import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/child_profile/ui/child_profile_page.dart';
import 'package:nest_loop_mobile/features/taskboard/state/taskboard_notifier.dart';
import 'package:nest_loop_mobile/features/taskboard/ui/new_task_page.dart';
import 'package:nest_loop_mobile/features/taskboard/widgets/task_calender.dart';
import 'package:nest_loop_mobile/features/taskboard/widgets/task_date_selection_widget.dart';
import 'package:nest_loop_mobile/features/taskboard/widgets/task_details_tile.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/floating_button_scaffold.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/onboarding_header_widget.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class TaskBoardPage extends ConsumerStatefulWidget {
  const TaskBoardPage({super.key});

  @override
  ConsumerState<TaskBoardPage> createState() => _TaskBoardPageState();
}

class _TaskBoardPageState extends ConsumerState<TaskBoardPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ref.read(taskBoardNotifier.notifier).getTasks(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: AppScaffold(
        isLoading: ValueNotifier(ref.watch(taskBoardNotifier).isLoading),
        backgroundColor: AppColors.neutralWhite,
        padding: EdgeInsets.zero,
        appBarContent: Column(
          children: [
            OnboardingHeaderWidget(
              header: AppStrings.taskBoard,
              subtext: AppStrings.seeYourChildrensProfile,
            ),
            16.sbH,
            Container(
              height: 44.ah,
              padding: EdgeInsets.symmetric(vertical: 4.ah, horizontal: 4.aw),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.ar),
                color: AppColors.slateCharcoal06,
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.ar),
                  color: AppColors.baseBackground,
                ),
                labelColor: AppColors.slateCharcoalMain,
                labelStyle: AppTextStyles.h3Inter(
                  context,
                ).copyWith(fontSize: 13.asp),
                unselectedLabelColor: AppColors.slateCharcoal60,
                unselectedLabelStyle: AppTextStyles.body1RegularInter(
                  context,
                ).copyWith(fontSize: 13.asp, color: AppColors.slateCharcoal60),
                onTap: (page) =>
                    ref.watch(taskBoardNotifier.notifier).updatePage(page),
                tabs: [
                  Tab(text: AppStrings.calender),
                  Tab(text: AppStrings.list),
                ],
              ),
            ),
            16.sbH,
          ],
        ),
        centerTile: true,
        toolbarHeight: 145.ah,
        toolbarElevation: 0.2.ar,
        body: FloatingWidgetScaffold(
          bottomPositioned: 200.ah,
          floatingWidget: AppButton(
            onTap: () => context.pushSuper(NewTaskPage()),
            title: AppStrings.task,
            prefixButtonIcon: Icon(
              CupertinoIcons.plus,
              size: 22.ar,
              color: AppColors.neutralWhite,
            ),
            borderColor: AppColors.neutralWhite,
            borderWidth: 4.aw,
          ),
          pageContent: Container(
            padding: EdgeInsets.symmetric(vertical: 16.ah, horizontal: 16.aw),
            color: AppColors.baseBackground,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TaskDateSelectionWidget(),
                  16.sbH,
                  if (ref.watch(taskBoardNotifier).taskList.isNotEmpty) ...[
                    WidgetCasing(
                      outerTitle: AppStrings.todaysTask,
                      suffixOuterTitle: Badge.count(
                        padding: EdgeInsets.all(4.ar),
                        count: ref
                            .watch(taskBoardNotifier.notifier)
                            .getDaysTasks(
                              ref
                                      .watch(taskBoardNotifier)
                                      .selectedCalenderDay ??
                                  DateTime.now(),
                            )
                            .length,
                        backgroundColor: AppColors.baseBackground,
                        textColor: AppColors.slateCharcoalMain,
                        textStyle: AppTextStyles.body2RegularInter(context)
                            .copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.slateCharcoalMain,
                            ),
                      ),
                      content: Column(
                        spacing: 6.ah,
                        children: List.generate(
                          ref
                              .watch(taskBoardNotifier.notifier)
                              .getDaysTasks(
                                ref
                                        .watch(taskBoardNotifier)
                                        .selectedCalenderDay ??
                                    DateTime.now(),
                              )
                              .length,
                          (index) {
                            final details = ref
                                .watch(taskBoardNotifier.notifier)
                                .getDaysTasks(
                                  ref
                                          .watch(taskBoardNotifier)
                                          .selectedCalenderDay ??
                                      DateTime.now(),
                                )
                                .elementAt(index);
                            return TaskDetailsTile(taskInfo: details);
                          },
                        ),
                      ),
                    ),
                  ],
                  40.sbH,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
