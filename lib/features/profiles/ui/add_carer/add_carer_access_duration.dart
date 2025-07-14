import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/profiles/state/add_carer/add_carer_notifier.dart';
import 'package:nest_loop_mobile/features/profiles/widgets/carer_duration_selector_tile.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/access_durations.dart';
import 'package:nest_loop_mobile/utils/extensions/date_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_back_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/onboarding_header_widget.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class AddCarerAccessDuration extends ConsumerWidget {
  const AddCarerAccessDuration({super.key});

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
            header: AppStrings.accessDuration,
            subtext: AppStrings.accessDurationSubtitle,
          ),
          32.sbH,
          WidgetCasing(
            outerContent: SizedBox.shrink(),
            padding: EdgeInsets.fromLTRB(8.aw, 0.ah, 8.aw, 8.aw),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        horizontalPadding: 19.aw,
                        selectedDuration:
                            ref
                                .watch(addCarerNotifier)
                                .selectedAccessDuration ??
                            AccessDurations.none,
                        durationType: AccessDurations.expiry,
                        leadingIcon: Icons.calendar_month,
                        title: AppStrings.timeLimited,
                        subtitle: AppStrings.accessEndSpecificDate,
                        onTap: (duration) => ref
                            .watch(addCarerNotifier.notifier)
                            .updateAccessDuration(duration),
                      ),
                      8.sbW,
                      CarerDurationSelectorTile(
                        horizontalPadding: 19.aw,
                        selectedDuration:
                            ref
                                .watch(addCarerNotifier)
                                .selectedAccessDuration ??
                            AccessDurations.none,
                        durationType: AccessDurations.ongoing,
                        leadingIcon: Icons.all_inclusive_outlined,
                        title: AppStrings.ongoing,
                        subtitle: AppStrings.noAutomaticExpiration,
                        onTap: (duration) => ref
                            .watch(addCarerNotifier.notifier)
                            .updateAccessDuration(duration),
                      ),
                    ],
                  ),
                ),
                if(ref.watch(addCarerNotifier).showQuickTimeSelect)...[
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
                          ref.watch(addCarerNotifier).timeOptions.length,
                              (index) => InkWell(
                            onTap: () => ref
                                .watch(addCarerNotifier.notifier)
                                .updateTimeOption(
                              context: context,
                              time: ref
                                  .watch(addCarerNotifier)
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
                                      .watch(addCarerNotifier)
                                      .quickTimeSelection
                                      .contains(
                                    ref
                                        .watch(addCarerNotifier)
                                        .timeOptions
                                        .elementAt(index),
                                  )
                                      ? AppColors.primaryOrange
                                      : Colors.transparent,
                                ),
                              ),
                              child: Text(
                                ref
                                    .watch(addCarerNotifier)
                                    .timeOptions
                                    .elementAt(index),
                                style: AppTextStyles.h2Inter(context)
                                    .copyWith(
                                  fontSize: 13.asp,
                                  fontWeight:
                                  ref
                                      .watch(addCarerNotifier)
                                      .quickTimeSelection
                                      .contains(
                                    ref
                                        .watch(addCarerNotifier)
                                        .timeOptions
                                        .elementAt(index),
                                  )
                                      ? FontWeight.w500
                                      : FontWeight.w400,
                                  color:
                                  ref
                                      .watch(addCarerNotifier)
                                      .quickTimeSelection
                                      .contains(
                                    ref
                                        .watch(addCarerNotifier)
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
                          InkWell(
                            onTap: () => ref
                                .watch(addCarerNotifier.notifier)
                                .updateTimeOption(
                              context: context,
                              time: AppStrings.custom,
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
                                      .watch(addCarerNotifier)
                                      .quickTimeSelection
                                      .contains(AppStrings.custom)
                                      ? AppColors.primaryOrange
                                      : Colors.transparent,
                                ),
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
                                    (ref
                                        .watch(addCarerNotifier)
                                        .quickTimeSelection
                                        .contains(
                                      AppStrings.custom,
                                    ) &&
                                        ref
                                            .watch(addCarerNotifier)
                                            .selectedTimeDuration !=
                                            null)
                                        ? ref
                                        .watch(addCarerNotifier)
                                        .selectedTimeDuration!
                                        .formatted
                                        : AppStrings.custom,
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
                  ),
                ],
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
                  onTap: () => ref
                      .watch(addCarerNotifier.notifier)
                      .validateThirdPage(context),
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
