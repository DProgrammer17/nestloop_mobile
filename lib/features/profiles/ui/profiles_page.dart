import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/features/child_profile/ui/child_profile_page.dart';
import 'package:nest_loop_mobile/features/child_profile/widgets/profile_info_tile.dart';
import 'package:nest_loop_mobile/features/profiles/state/add_carer/add_carer_notifier.dart';
import 'package:nest_loop_mobile/features/profiles/state/profile_notifier.dart';
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
      isLoading: ValueNotifier(ref.watch(profilesNotifier).isLoading),
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
          onTap: () => context.pushSuper(ChildProfilePage()),
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
          child: RefreshIndicator(
            onRefresh: () =>
                ref.watch(profilesNotifier.notifier).getChildProfiles(context),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: 32.ah),
                child: Column(
                  spacing: 16.ar,
                  children: List.generate(
                    ref.watch(profilesNotifier).childProfiles.length,
                    (index) => ProfileInfoTile(
                      model: ref
                          .watch(profilesNotifier)
                          .childProfiles
                          .elementAt(index),
                      detailsAction: () {
                        ref
                            .watch(addCarerNotifier.notifier)
                            .updateSelectedChild(
                              ref
                                  .watch(profilesNotifier)
                                  .childProfiles
                                  .elementAt(index),
                            );
                        context.pushSuper(
                          ProfileDetails(
                            model: ref
                                .watch(profilesNotifier)
                                .childProfiles
                                .elementAt(index),
                          ),
                        );
                      },
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
