import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/child_profile/child_profile_notifier.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/child_profile/model/child_profile_model.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/widgets/profile_image_widget.dart';
import 'package:nest_loop_mobile/features/profiles/state/profile_notifier.dart';
import 'package:nest_loop_mobile/features/profiles/ui/profile_details/care_details_page.dart';
import 'package:nest_loop_mobile/features/profiles/ui/profile_details/care_documents_page.dart';
import 'package:nest_loop_mobile/features/profiles/ui/profile_details/care_team_page.dart';
import 'package:nest_loop_mobile/features/profiles/ui/profile_details/child_overview_page.dart';
import 'package:nest_loop_mobile/utils/extensions/string_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_back_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/tiles/info_tile.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class ProfileDetails extends ConsumerStatefulWidget {
  final ChildProfileModel model;
  const ProfileDetails({super.key, required this.model});

  @override
  ConsumerState<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends ConsumerState<ProfileDetails>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: AppScaffold(
        backgroundColor: AppColors.neutralWhite,
        padding: EdgeInsets.zero,
        appBarLeadingContent: AppBackButton(size: 28.ar),
        appBarContent: Text(
          widget.model.name,
          style: AppTextStyles.h4Inter(
            context,
          ).copyWith(fontWeight: FontWeight.w700),
        ),
        centerTile: true,
        appBarBottomContent: TabBar(
          indicatorColor: AppColors.slateCharcoalMain,
          indicatorWeight: 2.5.aw,
          labelColor: AppColors.slateCharcoalMain,
          labelStyle: AppTextStyles.body1RegularInter(
            context,
          ).copyWith(fontWeight: FontWeight.w700),
          unselectedLabelColor: AppColors.slateCharcoal40,
          unselectedLabelStyle: AppTextStyles.body1RegularInter(
            context,
          ).copyWith(color: AppColors.slateCharcoal40),
          onTap: (page) =>
              ref.watch(profilesNotifier.notifier).updatePage(page),
          tabs: [
            Tab(
              icon: SvgPicture.asset(
                SvgAssets.childOverviewIcon,
                height: 33.ar,
                color: ref.watch(profilesNotifier).currentTabPage == 0
                    ? AppColors.slateCharcoalMain
                    : AppColors.slateCharcoal40,
              ),
              iconMargin: EdgeInsets.symmetric(vertical: 2.ah),
              text: AppStrings.overview,
            ),
            Tab(
              icon: SvgPicture.asset(
                SvgAssets.prescriptionIcon,
                height: 33.ar,
                color: ref.watch(profilesNotifier).currentTabPage == 1
                    ? AppColors.slateCharcoalMain
                    : AppColors.slateCharcoal40,
              ),
              iconMargin: EdgeInsets.symmetric(vertical: 2.ah),
              text: AppStrings.careDetails,
            ),
            Tab(
              icon: SvgPicture.asset(
                SvgAssets.documentIcon,
                height: 33.ar,
                color: ref.watch(profilesNotifier).currentTabPage == 2
                    ? AppColors.slateCharcoalMain
                    : AppColors.slateCharcoal40,
              ),
              iconMargin: EdgeInsets.symmetric(vertical: 2.ah),
              text: AppStrings.documents,
            ),
            Tab(
              icon: SvgPicture.asset(
                SvgAssets.careTeamIcon,
                height: 33.ar,
                color: ref.watch(profilesNotifier).currentTabPage == 3
                    ? AppColors.slateCharcoalMain
                    : AppColors.slateCharcoal40,
              ),
              iconMargin: EdgeInsets.symmetric(vertical: 2.ah),
              text: AppStrings.careTeam,
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 24.ah, horizontal: 16.aw),
          color: AppColors.baseBackground,
          child: TabBarView(
            children: [
              ChildOverviewPage(model: widget.model),
              CareDetailsPage(model: widget.model),
              CareDocumentsPage(model: widget.model),
              CareTeamPage(),
            ],
          ),
        ),
      ),
    );
  }
}
