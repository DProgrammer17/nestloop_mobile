import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/child_profile/child_profile_notifier.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/child_profile/model/child_profile_model.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/widgets/child_profile/profile_info_tile.dart';
import 'package:nest_loop_mobile/features/bottom_nav/ui/app_bottom_nav.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_back_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/empty_appbar.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/onboarding_header_widget.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class ChildProfileSummary extends ConsumerWidget {
  const ChildProfileSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      appBarContent: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBackButton(size: 29.ar),
          8.sbW,
          Text(
            AppStrings.editProfile,
            style: AppTextStyles.body4RegularInter(context).copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.highlightCTAOrange,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            32.sbH,
            OnboardingHeaderWidget(
              header: AppStrings.yourChildProfile,
              subtext: AppStrings.childProfileSummary,
            ),
            32.sbH,
            Column(
              spacing: 15.ah,
              children: List.generate(
                ref.watch(childProfileNotifier).childProfiles.length,
                (index) => ProfileInfoTile(
                  model: ref
                      .watch(childProfileNotifier)
                      .childProfiles
                      .elementAt(index),
                  showRemove:
                      ref.watch(childProfileNotifier).childProfiles.length > 1,
                  removeAction: () => ref
                      .watch(childProfileNotifier.notifier)
                      .removeFromChildProfile(
                        ref
                            .watch(childProfileNotifier)
                            .childProfiles
                            .elementAt(index),
                      ),
                ),
              ),
            ),
            16.sbH,
            AppButton(
              width: double.infinity,
              onTap: () => ref
                  .watch(childProfileNotifier.notifier)
                  .clearProfileFields(
                    context: context,
                    onSuccess: () => context.popSuper(),
                  ),
              title: AppStrings.addAnotherChild,
              textColor: AppColors.slateCharcoalMain,
              buttonColor: AppColors.neutralWhite,
              borderColor: AppColors.slateCharcoal06,
              borderWidth: 2.aw,
              prefixButtonIcon: Icon(
                CupertinoIcons.add,
                size: 22.ar,
                color: AppColors.highlightCTAOrange,
              ),
            ),
            80.sbH,
            AppButton(
              onTap: ()=> context.pushSuper(AppBottomNav()),
              title: AppStrings.goToDashboard,
              prefixButtonIcon: Icon(
                Icons.home_filled,
                size: 22.ar,
                color: AppColors.neutralWhite,
              ),
            ),
            40.sbH,
          ],
        ),
      ),
    );
  }
}
