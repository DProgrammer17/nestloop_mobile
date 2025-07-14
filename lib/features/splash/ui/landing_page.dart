import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/sign_up_notifier.dart';
import 'package:nest_loop_mobile/features/splash/state/splash_page_vm.dart';
import 'package:nest_loop_mobile/features/splash/widgets/role_selector_tile.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/user_roles.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/empty_appbar.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class LandingPage extends ConsumerWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      appBar: EmptyAppBar(),
      body: Column(
        children: [
          Image.asset(
            AppAssets.nestLoopLogoImage,
            height: AppConstants.deviceHeight * 0.55,
            width: double.infinity,
          ),
          Text(
            AppStrings.parentOrCaregiver,
            style: AppTextStyles.body4RegularInter(
              context,
            ).copyWith(color: AppColors.slateCharcoal80),
          ),
          20.sbH,
          WidgetCasing(
            outerContent: SizedBox.shrink(),
            padding: EdgeInsets.fromLTRB(8.aw, 0.ah, 8.aw, 8.aw),
            content: Column(
              spacing: 8.ah,
              children: [
                RoleSelectorTile(
                  onTap: () => SplashPageVM().setGlobalUserRole(
                    context: context,
                    role: UserRoles.parent,
                  ),
                  leadingICon: SvgPicture.asset(
                    SvgAssets.aParentIcon,
                    height: 25.ar,
                  ),
                  title: AppStrings.aParent,
                ),
                RoleSelectorTile(
                  onTap: () => SplashPageVM().setGlobalUserRole(
                    context: context,
                    role: UserRoles.careProvider,
                  ),
                  leadingICon: SvgPicture.asset(
                    SvgAssets.aCareGiverIcon,
                    height: 25.ar,
                  ),
                  title: AppStrings.aCaregiver,
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
