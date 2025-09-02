import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/profiles/state/add_carer/add_carer_notifier.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/care_permissions.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_back_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/onboarding_header_widget.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/tiles/info_switch_tile.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/tiles/selector_tab_tile.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class AddCarerSetPermissions extends ConsumerWidget {
  const AddCarerSetPermissions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: AppBackButton(
              onTap: () {
                ref
                    .watch(addCarerNotifier)
                    .carerPageController
                    .previousPage(
                      duration: Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                    );
                ref.watch(addCarerNotifier.notifier).updatePage(0);
              },
            ),
          ),
          32.sbH,
          OnboardingHeaderWidget(
            header: AppStrings.setPermissions,
            subtext: AppStrings.addCarerSubtitle,
          ),
          32.sbH,

          ///Mid Content
          Padding(
            padding: EdgeInsets.only(left: 12.aw),
            child: Text(
              AppStrings.whatCanSee(
                ref.watch(addCarerNotifier).carerNameController.text,
              ),
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
                  enabled: ref
                      .watch(addCarerNotifier)
                      .permissions
                      .any((e) => e == CarePermissions.profileBasics),
                  onEnabled: (value) {
                    if (value) {
                      ref
                          .watch(addCarerNotifier.notifier)
                          .addToPermissions(CarePermissions.profileBasics);
                      return;
                    }
                    ref
                        .watch(addCarerNotifier.notifier)
                        .removeFromPermissions(CarePermissions.profileBasics);
                  },
                ),
                InfoSwitchTile(
                  leadingIcon: SvgPicture.asset(
                    SvgAssets.prescriptionIcon,
                    height: 24.ah,
                    color: AppColors.slateCharcoal40,
                  ),
                  title: AppStrings.careDetails,
                  subtitle: AppStrings.careDetailsSubtitle,
                  enabled: ref
                      .watch(addCarerNotifier)
                      .permissions
                      .any((e) => e == CarePermissions.careDetails),
                  onEnabled: (value) {
                    if (value) {
                      ref
                          .watch(addCarerNotifier.notifier)
                          .addToPermissions(CarePermissions.careDetails);
                      return;
                    }
                    ref
                        .watch(addCarerNotifier.notifier)
                        .removeFromPermissions(CarePermissions.careDetails);
                  },
                ),
                InfoSwitchTile(
                  leadingIcon: SvgPicture.asset(
                    SvgAssets.documentIcon,
                    height: 24.ah,
                    color: AppColors.slateCharcoal40,
                  ),
                  title: AppStrings.documents,
                  subtitle: AppStrings.documentsSubtitle,
                  enabled: ref
                      .watch(addCarerNotifier)
                      .permissions
                      .any((e) => e == CarePermissions.documents),
                  onEnabled: (value) {
                    if (value) {
                      ref
                          .watch(addCarerNotifier.notifier)
                          .addToPermissions(CarePermissions.documents);
                      return;
                    }
                    ref
                        .watch(addCarerNotifier.notifier)
                        .removeFromPermissions(CarePermissions.documents);
                  },
                ),
              ],
            ),
          ),
          32.sbH,
          Padding(
            padding: EdgeInsets.only(left: 12.aw),
            child: Text(
              AppStrings.whatCanAccess(
                ref.watch(addCarerNotifier).carerNameController.text,
              ),
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
                          .watch(addCarerNotifier)
                          .selectedType,
                      options: ref.watch(addCarerNotifier).accessTypes,
                      onTap: (value) => ref
                          .watch(addCarerNotifier.notifier)
                          .selectorUpdateAccessType(value),
                    ),
                  ),
                ),
              ],
            ),
          ),
          32.sbH,
          Divider(thickness: 1.aw, color: AppColors.slateCharcoal06),
          16.sbH,
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  onTap: () => ref.watch(addCarerNotifier.notifier).validateSecondPage(context),
                  title: AppStrings.next,
                  buttonIcon: SvgPicture.asset(
                    SvgAssets.arrowCircleRightIcon,
                    height: 24.ah,
                    width: 24.aw,
                    color: AppColors.neutralWhite,
                  ),
                ),
                10.sbH,
                AppButton(
                  onTap: () => context.popSuper(),
                  title: AppStrings.cancel,
                  textColor: AppColors.slateCharcoalMain,
                  buttonColor: AppColors.baseBackground,
                  borderColor: AppColors.slateCharcoal06,
                  borderWidth: 2.aw,
                ),
              ],
            ),
          ),
          30.sbH,
        ],
      ),
    );
  }
}
