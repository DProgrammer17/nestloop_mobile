import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/child_profile/child_profile_notifier.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/widgets/child_profile/profile_info_tile.dart';
import 'package:nest_loop_mobile/features/profiles/ui/profile_details/profile_details.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/floating_button_scaffold.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/onboarding_header_widget.dart';

class ProfilesPage extends ConsumerWidget {
  const ProfilesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      backgroundColor: AppColors.neutralWhite,
      padding: EdgeInsets.zero,
      appBarContent: OnboardingHeaderWidget(
        header: AppStrings.profiles,
        subtext: AppStrings.seeYourChildrensProfile,
      ),
      centerTile: true,
      toolbarHeight: 90.ah,
      toolbarElevation: 0.2.ar,
      body: FloatingWidgetScaffold(
        floatingWidget: AppButton(
          title: AppStrings.addChild,
          prefixButtonIcon: Icon(
            Icons.home_filled,
            size: 22.ar,
            color: AppColors.neutralWhite,
          ),
          borderColor: AppColors.neutralWhite,
          borderWidth: 4.aw,
        ),
        pageContent: Container(
          padding: EdgeInsets.symmetric(vertical: 24.ah, horizontal: 16.aw),
          color: AppColors.baseBackground,
          child: SingleChildScrollView(
            child: Column(
              spacing: 16.ar,
              children: List.generate(
                ref.watch(childProfileNotifier).childProfiles.length,
                (index) => ProfileInfoTile(
                  model: ref
                      .watch(childProfileNotifier)
                      .childProfiles
                      .elementAt(index),
                  detailsAction: () => context.pushSuper(
                    ProfileDetails(
                      model: ref
                          .watch(childProfileNotifier)
                          .childProfiles
                          .elementAt(index),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
