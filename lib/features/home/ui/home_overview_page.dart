import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/home/state/home_notifier.dart';
import 'package:nest_loop_mobile/features/home/widget/date_selection_widget.dart';
import 'package:nest_loop_mobile/features/home/widget/home_child_widget.dart';
import 'package:nest_loop_mobile/features/profiles/widgets/routine_info_tile.dart';
import 'package:nest_loop_mobile/utils/extensions/date_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class HomeOverviewPage extends ConsumerWidget {
  const HomeOverviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: RefreshIndicator(
        onRefresh: () => ref.watch(homeNotifier.notifier).getUserData(context),
        child: Builder(
          builder: (_) {
            if (ref.watch(homeNotifier).userResponse == null ||
                ref.watch(homeNotifier).userResponse!.children!.isEmpty) {
              return InkWell(
                onTap: () =>
                    ref.watch(homeNotifier.notifier).getUserData(context),
                child: Container(
                  height: 40.ah,
                  width: 40.aw,
                  color: AppColors.baseRed,
                ),
              );
            }
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 24.ah, horizontal: 16.aw),
              child: Column(
                children: [
                  24.sbH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 6.ah,
                    children: List.generate(
                      ref.watch(homeNotifier).userResponse!.children!.length,
                      (index) => HomeChildWidget(
                        childInfo: ref
                            .watch(homeNotifier)
                            .userResponse!
                            .children!
                            .elementAt(index),
                        selectedChildID:
                            ref.watch(homeNotifier).selectedChild?.id ?? '',
                        onSelect: (child) =>
                            ref.watch(homeNotifier.notifier).updateChild(child),
                      ),
                    ),
                  ),
                  32.sbH,
                  Builder(
                    builder: (context) {
                      if (ref.watch(homeNotifier).selectedChild == null) {
                        return SizedBox();
                      }
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.childRoutine(
                                  ref
                                          .watch(homeNotifier)
                                          .selectedChild
                                          ?.name
                                          ?.split(' ')
                                          .first ??
                                      '',
                                ),
                                style: AppTextStyles.h5Inter(
                                  context,
                                ).copyWith(fontWeight: FontWeight.w700),
                              ),
                              Text(
                                AppStrings.viewFullRoutine,
                                style: AppTextStyles.body2RegularInter(context)
                                    .copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.secondaryPop,
                                    ),
                              ),
                            ],
                          ),
                          17.sbH,
                          WidgetCasing(
                            padding: EdgeInsets.symmetric(
                              vertical: 6.ah,
                              horizontal: 6.aw,
                            ),
                            contentSpacing: 0,
                            outerContent: SizedBox.shrink(),
                            content: Column(
                              children: [
                                DateSelectionWidget(
                                  dateFilter:
                                      (ref.watch(homeNotifier).currentFilter ??
                                              DateTime.now())
                                          .monthYearFormat,
                                  backAction: () => ref
                                      .watch(homeNotifier.notifier)
                                      .setFilterDate(minus: true),
                                  forwardAction: () => ref
                                      .watch(homeNotifier.notifier)
                                      .setFilterDate(add: true),
                                ),
                                6.sbH,
                                Column(
                                  spacing: 6.ah,
                                  children: List.generate(
                                    ref
                                            .watch(homeNotifier)
                                            .selectedChild!
                                            .dailyRoutine
                                            ?.length ??
                                        0,
                                    (index) => RoutineInfoTile(
                                      info: ref
                                          .watch(homeNotifier)
                                          .selectedChild!
                                          .dailyRoutine!
                                          .elementAt(index),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
