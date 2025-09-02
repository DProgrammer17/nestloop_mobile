import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/widgets/textfield_outer_tile.dart';
import 'package:nest_loop_mobile/features/child_profile/state/child_profile_notifier.dart';
import 'package:nest_loop_mobile/features/profiles/state/profile_notifier.dart';
import 'package:nest_loop_mobile/features/taskboard/state/taskboard_notifier.dart';
import 'package:nest_loop_mobile/features/taskboard/widgets/task_category_info_tile.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/task_categories.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/utils/textfield_formatter/date_formatter.dart';
import 'package:nest_loop_mobile/utils/textfield_formatter/time_hhmm_formatter.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_switch.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_text_field.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_back_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/casing_app_text_field.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/dropdowns/app_dropdown.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/dropdowns/app_platform_dropdown.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/onboarding_header_widget.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class NewTaskPage extends ConsumerWidget {
  const NewTaskPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      padding: EdgeInsets.symmetric(horizontal: 16.aw),
      appBarContent: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: AppBackButton(size: 30.ar),
          ),
          32.sbH,
          OnboardingHeaderWidget(
            header: AppStrings.newTask,
            subtext: AppStrings.createATask,
          ),
        ],
      ),
      centerTile: true,
      toolbarHeight: 145.ah,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CasingAppTextfield(
              controller: ref.watch(taskBoardNotifier).taskNameController,
              outerContent: TextFieldOuterTile(
                leading: Icon(
                  Icons.check,
                  size: 21.ar,
                  color: AppColors.slateCharcoalMain,
                ),
                title: AppStrings.taskName,
              ),
              hintText: AppStrings.taskNameHint,
              horizontalPadding: 0,
            ),
            8.sbH,
            WidgetCasing(
              outerContent: TextFieldOuterTile(
                leading: SvgPicture.asset(
                  SvgAssets.categorySearchIcon,
                  height: 26.ar,
                  color: AppColors.slateCharcoalMain,
                ),
                title: AppStrings.taskCategory,
              ),
              content: Wrap(
                spacing: 8.aw,
                runSpacing: 8.ah,
                children: [
                  TaskCategoryInfoTile(
                    leadingIcon: SvgPicture.asset(
                      SvgAssets.medicationIcon,
                      height: 24.ah,
                    ),
                    tileColor: AppColors.basePlum,
                    title: TaskCategories.medication,
                    subtitle: AppStrings.medicationSubText,
                    selectedCategory: ref.watch(taskBoardNotifier).selectedTaskCategory,
                    onSelected: (category)=> ref.watch(taskBoardNotifier.notifier).updateTaskCategory(category),
                  ),
                  TaskCategoryInfoTile(
                    leadingIcon: SvgPicture.asset(
                      SvgAssets.therapyIcon,
                      height: 24.ah,
                    ),
                    tileColor: AppColors.indigo,
                    title: TaskCategories.therapy,
                    subtitle: AppStrings.therapySubText,
                    selectedCategory: ref.watch(taskBoardNotifier).selectedTaskCategory,
                    onSelected: (category)=> ref.watch(taskBoardNotifier.notifier).updateTaskCategory(category),
                  ),
                  TaskCategoryInfoTile(
                    leadingIcon: SvgPicture.asset(
                      SvgAssets.appointmentIcon,
                      height: 24.ah,
                    ),
                    tileColor: AppColors.onlineGreen,
                    title: TaskCategories.appointment,
                    subtitle: AppStrings.appointmentSubText,
                    selectedCategory: ref.watch(taskBoardNotifier).selectedTaskCategory,
                    onSelected: (category)=> ref.watch(taskBoardNotifier.notifier).updateTaskCategory(category),
                  ),
                  TaskCategoryInfoTile(
                    leadingIcon: SvgPicture.asset(
                      SvgAssets.otherIcon,
                      height: 24.ah,
                    ),
                    tileColor: AppColors.violet,
                    title: TaskCategories.others,
                    subtitle: AppStrings.medicationSubText,
                    selectedCategory: ref.watch(taskBoardNotifier).selectedTaskCategory,
                    onSelected: (category)=> ref.watch(taskBoardNotifier.notifier).updateTaskCategory(category),
                  ),
                ],
              ),
            ),
            16.sbH,
            WidgetCasing(
              outerContent: TextFieldOuterTile(
                leading: Icon(
                  Icons.calendar_today_outlined,
                  size: 22.ar,
                  color: AppColors.slateCharcoalMain,
                ),
                title: AppStrings.schedule,
              ),
              content: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: AppTextField(
                          controller: ref
                              .watch(taskBoardNotifier)
                              .scheduleDayController,
                          verticalPadding: 3.ah,
                          horizontalPadding: 0,
                          hintText: AppStrings.dobHint,
                          onChanged: (value) {},
                          contentPadding: EdgeInsets.fromLTRB(
                            10.aw,
                            5.ah,
                            5.aw,
                            5.ah,
                          ),
                          hintStyle: AppTextStyles.body1RegularInter(context)
                              .copyWith(
                                fontSize: 13.asp,
                                color: AppColors.slateCharcoal80,
                              ),
                          style: AppTextStyles.body1RegularInter(
                            context,
                          ).copyWith(fontSize: 13.asp),
                          inputFormatter: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9\-]'),
                            ),
                            LengthLimitingTextInputFormatter(10),
                            DateInputFormatterYYYYMMdd(),
                          ],
                        ),
                      ),
                      10.sbW,
                      Flexible(
                        flex: 1,
                        child: AppTextField(
                          controller: ref
                              .watch(taskBoardNotifier)
                              .scheduleTimeController,
                          verticalPadding: 3.ah,
                          horizontalPadding: 0,
                          hintText: AppStrings.timeHint,
                          onChanged: (value) {},
                          contentPadding: EdgeInsets.fromLTRB(
                            20.aw,
                            5.ah,
                            5.aw,
                            5.ah,
                          ),
                          hintStyle: AppTextStyles.body1RegularInter(context)
                              .copyWith(
                                fontSize: 13.asp,
                                color: AppColors.slateCharcoal80,
                              ),
                          style: AppTextStyles.body1RegularInter(
                            context,
                          ).copyWith(fontSize: 13.asp),
                          inputFormatter: [TimeInputFormatter()],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 16.ah,
                          horizontal: 18.aw,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.ar),
                          color: AppColors.neutralWhite,
                        ),
                        child: Icon(
                          Icons.location_on_outlined,
                          size: 23.ar,
                          color: AppColors.slateCharcoalMain,
                        ),
                      ),
                      8.sbW,
                      Flexible(
                        flex: 1,
                        child: AppTextField(
                          height: 52.ah,
                          controller: ref
                              .watch(taskBoardNotifier)
                              .scheduleAddressController,
                          horizontalPadding: 0,
                          hintText: AppStrings.scheduleAddressHint,
                          onChanged: (value) {},
                          hintStyle: AppTextStyles.body1RegularInter(context)
                              .copyWith(
                                fontSize: 13.asp,
                                color: AppColors.slateCharcoal80,
                              ),
                          style: AppTextStyles.body1RegularInter(
                            context,
                          ).copyWith(fontSize: 13.asp),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.ah,
                      horizontal: 16.aw,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.baseBackground,
                      borderRadius: BorderRadius.circular(16.ar),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.setRecurring,
                              style: AppTextStyles.h3Inter(
                                context,
                              ).copyWith(fontWeight: FontWeight.w500),
                            ),
                            3.sbH,
                            Text(
                              AppStrings.recurringTasksDaily,
                              style: AppTextStyles.body1RegularInter(
                                context,
                              ).copyWith(color: AppColors.slateCharcoal60),
                            ),
                          ],
                        ),
                        AppSwitch(selected: true, onChanged: (value) {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            16.sbH,
            WidgetCasing(
              outerContent: TextFieldOuterTile(
                leading: Icon(
                  Icons.add_moderator_outlined,
                  size: 22.ar,
                  color: AppColors.slateCharcoalMain,
                ),
                title: AppStrings.assignAndNotify,
              ),
              content: Column(
                children: [
                  AppPlatformDropdown(
                    withHint: false,
                    onChanged: (careId) {},
                    items: ref
                        .watch(profilesNotifier)
                        .careTeam
                        .map((e) => e.parent?.fullName ?? '')
                        .toList()..addAll(ref
                        .watch(profilesNotifier)
                        .careTeam
                        .map((e) => e.careProvider?.fullName ?? '')
                        .toList()),
                    dropdownValue: ValueNotifier(
                      ref.watch(taskBoardNotifier).assignedCareProviderName,
                    ),
                  ),
                  16.sbH,
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.ah,
                      horizontal: 16.aw,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.baseBackground,
                      borderRadius: BorderRadius.circular(16.ar),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.sendNotifications,
                              style: AppTextStyles.h3Inter(
                                context,
                              ).copyWith(fontWeight: FontWeight.w500),
                            ),
                            3.sbH,
                            Text(
                              AppStrings.notifyAssignedCareGivers,
                              style: AppTextStyles.body1RegularInter(
                                context,
                              ).copyWith(color: AppColors.slateCharcoal60),
                            ),
                          ],
                        ),
                        AppSwitch(selected: true, onChanged: (value) {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            16.sbH,
            CasingAppTextfield(
              height: 154.ah,
              controller: ref.watch(taskBoardNotifier).taskNotesController,
              outerContent: TextFieldOuterTile(leading: Icon(
                Icons.article_outlined,
                size: 22.ar,
                color: AppColors.slateCharcoalMain,
              ), title: AppStrings.notes),
              style: AppTextStyles.h3Inter(
                context,
              ).copyWith(fontWeight: FontWeight.w500),
              showOuterTile: true,
              outerTileSpacing: 12,
              hintText: AppStrings.addAdditionalDetails,
              horizontalPadding: 0,
              expand: true,
              minLines: null,
              maxLines: null,
            ),
            32.sbH,
            Divider(thickness: 1.aw, color: AppColors.slateCharcoal06),
            16.sbH,
            AppButton(
              onTap: () {},
              title: AppStrings.next,
              buttonIcon: SvgPicture.asset(
                SvgAssets.arrowCircleRightIcon,
                height: 24.ah,
                width: 24.aw,
                color: AppColors.neutralWhite,
              ),
            ),
            30.sbH,
          ],
        ),
      ),
    );
  }
}
