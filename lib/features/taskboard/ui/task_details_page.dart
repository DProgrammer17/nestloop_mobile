import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/widgets/textfield_outer_tile.dart';
import 'package:nest_loop_mobile/features/taskboard/widgets/detail_tile.dart';
import 'package:nest_loop_mobile/features/taskboard/widgets/task_catgeory_pill.dart';
import 'package:nest_loop_mobile/features/taskboard/widgets/task_quick_actions_tile.dart';
import 'package:nest_loop_mobile/features/taskboard/widgets/task_status_tile.dart';
import 'package:nest_loop_mobile/network/api/tasks/response/get_tasks_response.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/task_categories.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/task_statuses.dart';
import 'package:nest_loop_mobile/utils/extensions/date_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_network_image.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_back_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class TaskDetailsPage extends StatelessWidget {
  final GetTasksResponse task;
  const TaskDetailsPage({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      padding: EdgeInsets.symmetric(horizontal: 16.aw),
      centerTile: true,
      toolbarHeight: AppConstants.deviceHeight * 0.26,
      appBackgroundColor: AppColors.slateCharcoal06,
      appBarShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32.ar)),
      ),
      appBarContent: Container(
        decoration: BoxDecoration(
          color: AppColors.slateCharcoal06,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(32.ar)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppBackButton(size: 22.ar),
                Icon(
                  CupertinoIcons.delete,
                  size: 22.ar,
                  color: AppColors.highlightCTAOrange,
                ),
              ],
            ),
            32.sbH,
            TaskCategoryPill(
              category: task.categories?.first ?? TaskCategories.none,
            ),
            16.sbH,
            Text(
              task.title ?? AppStrings.task,
              style: AppTextStyles.h1Inter(context).copyWith(fontSize: 24.asp),
            ),
            8.sbH,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 12.ar,
                  color: AppColors.slateCharcoal80,
                ),
                2.sbW,
                Text(
                  (task.createdAt ?? DateTime.now()).toHumanFormat(),
                  style: AppTextStyles.body1RegularInter(
                    context,
                  ).copyWith(color: AppColors.slateCharcoal80),
                ),
              ],
            ),
            16.sbH,
            TaskStatusTile(status: task.status ?? TaskStatus.none),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            24.sbH,
            TaskQuickActionsTile(),
            24.sbH,
            WidgetCasing(
              outerContent: TextFieldOuterTile(
                leading: Icon(
                  Icons.info_outline_rounded,
                  size: 22.ar,
                  color: AppColors.slateCharcoalMain,
                ),
                title: AppStrings.details,
              ),
              content: Column(
                spacing: 12.ah,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(
                      vertical: 12.ah,
                      horizontal: 12.aw,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.baseBackground,
                      borderRadius: BorderRadius.circular(16.ar),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DetailTile(
                          leading: Container(
                            height: 40.ah,
                            width: 40.aw,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.ar),
                              color: AppColors.slateCharcoal06,
                            ),
                            child: Icon(
                              Symbols.location_on,
                              size: 24.ar,
                              color: AppColors.slateCharcoalMain,
                            ),
                          ),
                          info: AppStrings.location,
                          title: task.location ?? 'N/A',
                        ),
                        12.sbH,
                        DetailTile(
                          leading: AppNetworkImage(
                            image:
                                task.parent?.avatar?.url ??
                                task.careProvider?.avatar ??
                                '',
                            height: 40.ah,
                            width: 40.aw,
                            useBorderRadius: true,
                            radius: 8.ar,
                          ),
                          info: AppStrings.assignedTo,
                          title:
                              task.parent?.fullName ??
                              task.careProvider?.fullName ??
                              '',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(
                      vertical: 12.ah,
                      horizontal: 12.aw,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.baseBackground,
                      borderRadius: BorderRadius.circular(16.ar),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.notes,
                          style: AppTextStyles.h3Inter(context),
                        ),
                        12.sbH,
                        Text(
                          task.description ?? '',
                          style: AppTextStyles.body2RegularInter(context)
                              .copyWith(
                                fontSize: 15.asp,
                                color: AppColors.slateCharcoal60,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            24.sbH,
            Divider(thickness: 1.aw, color: AppColors.slateCharcoal06),
            16.sbH,
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    onTap: (){},
                    title: AppStrings.markAsComplete,
                    buttonIcon: SvgPicture.asset(
                      SvgAssets.arrowCircleRightIcon,
                      height: 24.ah,
                      width: 24.aw,
                      color: AppColors.neutralWhite,
                    ),
                  ),
                  10.sbH,
                  AppButton(
                    onTap: (){},
                    title: AppStrings.editTask,
                    prefixButtonIcon: Icon(
                      Symbols.edit,
                      size: 22.ar,
                      color: AppColors.slateCharcoal40,
                    ),
                    textColor: AppColors.slateCharcoalMain,
                    buttonColor: AppColors.slateCharcoal06,
                  ),
                ],
              ),
            ),
            30.sbH,
          ],
        ),
      ),
    );
  }
}
