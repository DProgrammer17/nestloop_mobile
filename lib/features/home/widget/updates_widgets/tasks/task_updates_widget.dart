import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/home/state/interim_task_activity_model.dart';
import 'package:nest_loop_mobile/network/api/user/response/get_user_profile_response.dart';
import 'package:nest_loop_mobile/utils/extensions/string_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_network_image.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/tiles/time_pill.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class TaskUpdatesWidget extends StatelessWidget {
  final TaskNotification notificationInfo;
  final ChildData child;
  const TaskUpdatesWidget({
    super.key,
    required this.child,
    required this.notificationInfo,
  });

  @override
  Widget build(BuildContext context) {
    return WidgetCasing(
      borderRadius: 16.ar,
      backgroundColor: AppColors.baseBackground,
      padding: EdgeInsets.fromLTRB(16.aw, 8.ah, 16.aw, 16.ah),
      outerContent: const SizedBox.shrink(),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 8.ah,
                width: 8.aw,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.highlightCTARed,
                ),
              ),
              6.sbW,
              TimePill(time: notificationInfo.time.toIso8601String().dateTo12HourFormat()),
            ],
          ),
          12.sbH,
          Text(
            notificationInfo.message,
            style: AppTextStyles.body2RegularInter(
              context,
            ).copyWith(color: AppColors.slateCharcoal80),
          ),
          16.sbH,
          Divider(thickness: 1.aw, color: AppColors.slateCharcoal06),
          16.sbH,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AppNetworkImage(
                    image: child.avatar?.url ?? '',
                    height: 24.ah,
                    width: 24.aw,
                    shape: BoxShape.circle,
                    useBorderRadius: false,
                  ),
                  6.sbW,
                  Text(
                    AppStrings.forChild(child.name ?? ''),
                    style: AppTextStyles.body1RegularInter(context).copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    AppStrings.viewTask,
                    style: AppTextStyles.body2RegularInter(context).copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.sbW,
                  Icon(
                    Symbols.chevron_forward,
                    size: 22.ar,
                    color: AppColors.primaryOrange,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
