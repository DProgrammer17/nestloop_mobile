import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/widgets/textfield_outer_tile.dart';
import 'package:nest_loop_mobile/features/communities/state/communities_notifier.dart';
import 'package:nest_loop_mobile/features/communities/widgets/sos/saftey_banner_widget.dart';
import 'package:nest_loop_mobile/features/communities/widgets/sos/sos_circle_member_tile.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/tiles/info_switch_tile.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class SosPage extends ConsumerWidget {
  const SosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafetyBannerWidget(),
          24.sbH,
          Divider(thickness: 1.aw, color: AppColors.slateCharcoal06),
          24.sbH,
          Visibility(
            visible: ref.watch(communitiesNotifier).sosMembers.length > 3,
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {},
                child: Text(
                  AppStrings.seeAll,
                  style: AppTextStyles.h3Inter(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryOrange,
                  ),
                ),
              ),
            ),
          ),
          12.sbH,
          Column(
            spacing: 8.ah,
            children: List.generate(
              ref.watch(communitiesNotifier).sosMembers.length > 3
                  ? 3
                  : ref.watch(communitiesNotifier).sosMembers.length,
              (index) => SOSCircleMemberTile(
                member: ref
                    .watch(communitiesNotifier)
                    .sosMembers
                    .elementAt(index),
              ),
            ),
          ),
          8.sbH,
          AppButton(
            width: double.infinity,
            onTap: () {},
            title: AppStrings.addEmergencyResponder,
            buttonColor: AppColors.neutralWhite,
            textColor: AppColors.slateCharcoalMain,
            buttonIcon: Icon(
              CupertinoIcons.plus,
              size: 22.ar,
              color: AppColors.slateCharcoalMain,
            ),
            borderColor: AppColors.slateCharcoal06,
            borderWidth: 2.aw,
          ),
          24.sbH,
          Text(
            AppStrings.privacySettings,
            style: AppTextStyles.h5Inter(
              context,
            ).copyWith(fontWeight: FontWeight.w700),
          ),
          16.sbH,
          InfoSwitchTile(
            padding: EdgeInsets.symmetric(vertical: 16.ah, horizontal: 16.aw),
            backgroundColor: AppColors.slateCharcoal06,
            leadingIcon: Icon(
              Symbols.emergency_share,
              size: 22.ar,
              color: AppColors.slateCharcoal40,
            ),
            title: AppStrings.sharePreciseLocation,
            subtitle: AppStrings.sharePreciseLocationInfo,
            enabled: true,
            onEnabled: (value) {},
          ),
          12.sbH,
          WidgetCasing(
            outerContent: TextFieldOuterTile(
              leading: Icon(
                Symbols.campaign,
                size: 22.ar,
                color: AppColors.slateCharcoalMain,
              ),
              title: AppStrings.alertTypes,
            ),
            content: Column(
              spacing: 8.ah,
              children: [
                InfoSwitchTile(
                  padding: EdgeInsets.symmetric(vertical: 16.ah, horizontal: 16.aw),
                  leadingIcon: Icon(
                    Symbols.chat_bubble,
                    size: 22.ar,
                    color: AppColors.slateCharcoal40,
                  ),
                  title: AppStrings.message,
                  subtitle: AppStrings.sosMessageInfo,
                  enabled: true,
                  onEnabled: (value) {},
                  bottomContent: Container(
                    padding: EdgeInsets.symmetric(vertical: 9.ah, horizontal: 18.aw),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.ar),
                      color: AppColors.slateCharcoal06,
                    ),
                    child: Text(
                      AppStrings.seeMessageTemplates,
                      style: AppTextStyles.body2RegularInter(context).copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                InfoSwitchTile(
                  padding: EdgeInsets.symmetric(vertical: 16.ah, horizontal: 16.aw),
                  leadingIcon: Icon(
                    Symbols.call,
                    size: 22.ar,
                    color: AppColors.slateCharcoal40,
                  ),
                  title: AppStrings.call,
                  subtitle: AppStrings.sosCallInfo,
                  enabled: true,
                  onEnabled: (value) {},
                ),
              ],
            ),
          ),
          32.sbH,
          Divider(thickness: 1.aw, color: AppColors.slateCharcoal06),
          16.sbH,
          Align(
            alignment: Alignment.center,
            child: AppButton(
              onTap: () {},
              title: AppStrings.saveSettings,
              buttonIcon: SvgPicture.asset(
                SvgAssets.arrowCircleRightIcon,
                height: 24.ah,
                width: 24.aw,
                color: AppColors.neutralWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
