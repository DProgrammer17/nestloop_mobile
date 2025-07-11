import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/profiles/state/parent_model.dart';
import 'package:nest_loop_mobile/features/profiles/state/profile_notifier.dart';
import 'package:nest_loop_mobile/features/profiles/widgets/carer_duration_selector_tile.dart';
import 'package:nest_loop_mobile/utils/enums/access_duration.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/tiles/info_switch_tile.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/tiles/selector_tab_tile.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class ManageCareAccessWidget extends ConsumerStatefulWidget {
  final CareTeamModel model;
  const ManageCareAccessWidget({super.key, required this.model});

  @override
  ConsumerState<ManageCareAccessWidget> createState() =>
      _ManageCareAccessWidgetState();
}

class _ManageCareAccessWidgetState
    extends ConsumerState<ManageCareAccessWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(profilesNotifier.notifier)
          .updateAccessType(widget.model.accessLevel);
      ref
          .read(profilesNotifier.notifier)
          .updateAccessDuration(widget.model.accessDuration);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetCasing(
          padding: EdgeInsets.fromLTRB(12.aw, 4.ah, 12.aw, 14.aw),
          outerContent: SizedBox.shrink(),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.admin_panel_settings_sharp,
                    size: 22.ar,
                    color: AppColors.baseGreen,
                  ),
                  4.sbW,
                  Text(
                    AppStrings.accessFor(widget.model.name),
                    style: AppTextStyles.body2RegularInter(
                      context,
                    ).copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              8.sbH,
              WidgetCasing(
                padding: EdgeInsets.fromLTRB(12.aw, 4.ah, 12.aw, 13.aw),
                borderRadius: 16.ar,
                backgroundColor: AppColors.slateCharcoalMain,
                outerContent: SizedBox.shrink(),
                content: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(7.ar),
                      child: Image.asset(
                        AppAssets.profileImagePlaceholder,
                        height: 34.ah,
                        width: 34.aw,
                        fit: BoxFit.cover,
                      ),
                    ),
                    10.sbW,
                    SizedBox(
                      width: 270.aw,
                      child: Text(
                        AppStrings.manageInfoAccess,
                        style: AppTextStyles.body2RegularInter(
                          context,
                        ).copyWith(color: AppColors.slateCharcoal06),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        32.sbH,
        Padding(
          padding: EdgeInsets.only(left: 12.aw),
          child: Text(
            AppStrings.whatCanSee(widget.model.name),
            style: AppTextStyles.body2RegularInter(context).copyWith(
              color: AppColors.slateCharcoal60,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        10.sbH,
        WidgetCasing(
          outerContent: SizedBox.shrink(),
          padding: EdgeInsets.fromLTRB(8.aw, 0.ah, 8.aw, 8.aw),
          content: Column(
            spacing: 8.ah,
            children: [
              InfoSwitchTile(
                leadingIcon: SvgPicture.asset(
                  SvgAssets.childOverviewIcon,
                  height: 24.ah,
                  color: AppColors.slateCharcoal40,
                ),
                title: AppStrings.profileBasics,
                subtitle: AppStrings.profileBasicsSubtitle,
                enabled: true,
                onEnabled: (value) {},
              ),
              InfoSwitchTile(
                leadingIcon: SvgPicture.asset(
                  SvgAssets.prescriptionIcon,
                  height: 24.ah,
                  color: AppColors.slateCharcoal40,
                ),
                title: AppStrings.careDetails,
                subtitle: AppStrings.careDetailsSubtitle,
                enabled: true,
                onEnabled: (value) {},
              ),
              InfoSwitchTile(
                leadingIcon: SvgPicture.asset(
                  SvgAssets.documentIcon,
                  height: 24.ah,
                  color: AppColors.slateCharcoal40,
                ),
                title: AppStrings.documents,
                subtitle: AppStrings.documentsSubtitle,
                enabled: false,
                onEnabled: (value) {},
              ),
            ],
          ),
        ),
        32.sbH,
        Padding(
          padding: EdgeInsets.only(left: 12.aw),
          child: Text(
            AppStrings.whatCanAccess(widget.model.name),
            style: AppTextStyles.body2RegularInter(context).copyWith(
              color: AppColors.slateCharcoal60,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        10.sbH,
        WidgetCasing(
          outerContent: SizedBox.shrink(),
          padding: EdgeInsets.fromLTRB(16.aw, 0.ah, 16.aw, 8.aw),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetCasing(
                backgroundColor: AppColors.baseBackground,
                borderRadius: 16.ar,
                outerContentPadding: 6.aw,
                outerContent: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.admin_panel_settings_outlined,
                      size: 22.ar,
                      color: AppColors.slateCharcoal40,
                    ),
                    8.sbW,
                    Text(
                      AppStrings.accessType,
                      style: AppTextStyles.h3Inter(
                        context,
                      ).copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                content: Padding(
                  padding: EdgeInsets.only(top: 8.ah),
                  child: SelectorTabTile(
                    selectedValue: ref
                        .watch(profilesNotifier)
                        .selectedAccessType,
                    options: ref.watch(profilesNotifier).accessTypes,
                    onTap: (value) => ref
                        .watch(profilesNotifier.notifier)
                        .selectorUpdateAccessType(value),
                  ),
                ),
              ),
              8.sbH,
              WidgetCasing(
                borderRadius: 16.ar,
                outerContentPadding: 6.aw,
                outerContent: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.alarm,
                      size: 22.ar,
                      color: AppColors.slateCharcoal40,
                    ),
                    8.sbW,
                    Text(
                      AppStrings.accessDuration,
                      style: AppTextStyles.h3Inter(
                        context,
                      ).copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CarerDurationSelectorTile(
                      selectedDuration:
                          ref.watch(profilesNotifier).selectedAccessDuration ??
                          AccessDuration.none,
                      durationType: AccessDuration.timeLimited,
                      leadingIcon: Icons.calendar_month,
                      title: AppStrings.timeLimited,
                      subtitle: AppStrings.accessEndSpecificDate,
                      onTap: (duration) => ref
                          .watch(profilesNotifier.notifier)
                          .updateAccessDuration(duration),
                    ),
                    8.sbW,
                    CarerDurationSelectorTile(
                      selectedDuration:
                          ref.watch(profilesNotifier).selectedAccessDuration ??
                          AccessDuration.none,
                      durationType: AccessDuration.ongoing,
                      leadingIcon: Icons.all_inclusive_outlined,
                      title: AppStrings.ongoing,
                      subtitle: AppStrings.noAutomaticExpiration,
                      onTap: (duration) => ref
                          .watch(profilesNotifier.notifier)
                          .updateAccessDuration(duration),
                    ),
                  ],
                ),
              ),
              8.sbH,
              WidgetCasing(
                borderRadius: 16.ar,
                outerContentPadding: 6.aw,
                outerTitle: AppStrings.quickSelectOption,
                content: Padding(
                  padding: EdgeInsets.only(top: 8.ah),
                  child: Wrap(
                    runSpacing: 10.ah,
                    spacing: 8.aw,
                    children:
                        List.generate(
                          ref.watch(profilesNotifier).timeOptions.length,
                          (index) => InkWell(
                            onTap: () => ref
                                .watch(profilesNotifier.notifier)
                                .updateTimeOption(
                                  ref
                                      .watch(profilesNotifier)
                                      .timeOptions
                                      .elementAt(index),
                                ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.ah,
                                horizontal: 20.aw,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.baseBackground,
                                borderRadius: BorderRadius.circular(12.ar),
                                border: Border.all(
                                  width: 1.aw,
                                  color:
                                      ref
                                          .watch(profilesNotifier)
                                          .quickTimeSelection
                                          .contains(
                                            ref
                                                .watch(profilesNotifier)
                                                .timeOptions
                                                .elementAt(index),
                                          )
                                      ? AppColors.primaryOrange
                                      : Colors.transparent,
                                ),
                              ),
                              child: Text(
                                ref
                                    .watch(profilesNotifier)
                                    .timeOptions
                                    .elementAt(index),
                                style: AppTextStyles.h2Inter(context).copyWith(
                                  fontSize: 13.asp,
                                  fontWeight:
                                      ref
                                          .watch(profilesNotifier)
                                          .quickTimeSelection
                                          .contains(
                                            ref
                                                .watch(profilesNotifier)
                                                .timeOptions
                                                .elementAt(index),
                                          )
                                      ? FontWeight.w500
                                      : FontWeight.w400,
                                  color:
                                      ref
                                          .watch(profilesNotifier)
                                          .quickTimeSelection
                                          .contains(
                                            ref
                                                .watch(profilesNotifier)
                                                .timeOptions
                                                .elementAt(index),
                                          )
                                      ? AppColors.slateCharcoalMain
                                      : AppColors.slateCharcoal60,
                                ),
                              ),
                            ),
                          ),
                        )..add(
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.ah,
                              horizontal: 20.aw,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.baseBackground,
                              borderRadius: BorderRadius.circular(12.ar),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  CupertinoIcons.add,
                                  size: 18.ar,
                                  color: AppColors.slateCharcoalMain,
                                ),
                                8.sbW,
                                Text(
                                  AppStrings.custom,
                                  style: AppTextStyles.h2Inter(
                                    context,
                                  ).copyWith(fontSize: 13.asp),
                                ),
                              ],
                            ),
                          ),
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        32.sbH,
        Center(
          child: AppButton(
            onTap: ()=> context.popSuper(),
            title: AppStrings.saveChanges,),
        ),
        32.sbH,
      ],
    );
  }
}
