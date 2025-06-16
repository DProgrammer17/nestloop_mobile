import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/features/onboarding/state/onboarding_notifier.dart';
import 'package:nest_loop_mobile/features/onboarding/widgets/onboarding_image_frame.dart';
import 'package:nest_loop_mobile/features/onboarding/widgets/onboarding_indicator_row.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/empty_appbar.dart';

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      padding: EdgeInsets.zero,
      appBar: EmptyAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
              controller: ref.watch(onboardingNotifier).onboardingPageController,
              onPageChanged: (page) => ref.watch(onboardingNotifier.notifier).updatePage(page),
              itemBuilder: (BuildContext ctx, int index) => OnboardingImageFrame(
                image: ref
                    .watch(onboardingNotifier)
                    .onboardingImageList
                    .elementAt(index),
                title: ref
                    .watch(onboardingNotifier)
                    .onboardingTitleList
                    .elementAt(index),
                subtext: ref
                    .watch(onboardingNotifier)
                    .onboardingSubtextList
                    .elementAt(index),
              ),
            ),
          ),
          if(ref.watch(onboardingNotifier).onboardingPageController.hasClients)...[
            OnboardingIndicatorRow(
              size: 4,
              currentIndex:
              (ref.watch(onboardingNotifier).currentPage ??
                  0)
                  .toInt(),
            ),
           (AppConstants.deviceHeight * 0.265).sbH,
            AppButton(
              onTap: () {
                if (ref.watch(onboardingNotifier).currentPage ==
                    3) {
                  ///Navigate to sign up page
                  return;
                }
                ref
                    .watch(onboardingNotifier)
                    .onboardingPageController
                    .nextPage(
                  duration: Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                );
              },
              buttonColor:
              ref.watch(onboardingNotifier).currentPage == 3
                  ? AppColors.primaryOrange
                  : AppColors.slateCharcoal06,
              textColor:
              ref.watch(onboardingNotifier).currentPage == 3
                  ? AppColors.neutralWhite
                  : AppColors.slateCharcoalMain,
              title:
              ref.watch(onboardingNotifier).currentPage == 3
                  ? AppStrings.getStarted
                  : AppStrings.skip,
              buttonIcon: SvgPicture.asset(
                ref.watch(onboardingNotifier).currentPage == 3
                    ? SvgAssets.arrowCircleRightIcon
                    : SvgAssets.skipIcon,
                height: 24.ah,
                width: 24.aw,
                color:
                ref.watch(onboardingNotifier).currentPage ==
                    3
                    ? AppColors.neutralWhite
                    : AppColors.slateCharcoalMain,
              ),
            ),
            24.sbH,
          ],
        ],
      ),
    );
  }
}
