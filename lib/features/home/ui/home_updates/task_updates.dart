import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/features/home/state/home_notifier.dart';
import 'package:nest_loop_mobile/features/home/widget/updates_widgets/tasks/child_image_widget.dart';
import 'package:nest_loop_mobile/features/home/widget/updates_widgets/tasks/task_updates_widget.dart';
import 'package:nest_loop_mobile/network/api/user/response/get_user_profile_response.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_network_image.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class TaskUpdates extends ConsumerWidget {
  const TaskUpdates({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.ah, horizontal: 12.aw),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: WidgetCasing(
              padding: EdgeInsets.symmetric(vertical: 6.ah, horizontal: 6.aw),
              contentSpacing: 0,
              outerContent: SizedBox.shrink(),
              content: Column(
                spacing: 8.ah,
                children: List.generate(
                  ref.watch(homeNotifier).taskUpdates.length,
                  (index) => TaskUpdatesWidget(
                    child: ref.watch(homeNotifier).selectedChild ?? ChildData(),
                    notificationInfo: ref
                        .watch(homeNotifier)
                        .taskUpdates
                        .elementAt(index),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 16.aw,
            bottom: 33.ah,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.ah, horizontal: 8.aw),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.ar),
                color: AppColors.baseBackground,
                border: Border.all(color: AppColors.slateCharcoal06, width: 1.aw),
              ),
              child: Row(
                children: List.generate(
                  ref.watch(homeNotifier).userResponse?.children?.length ?? 0,
                  (index) => ChildImageWidget(
                    child:
                        ref
                            .watch(homeNotifier)
                            .userResponse
                            ?.children
                            ?.elementAt(index) ??
                        ChildData(),
                    selectedChild:
                        ref.watch(homeNotifier).selectedChild ?? ChildData(),
                    onSelect: (child) =>
                        ref.watch(homeNotifier.notifier).updateChild(child),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
