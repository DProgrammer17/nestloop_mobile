import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/profiles/ui/profile_details/manage_care_access_widget.dart';
import 'package:nest_loop_mobile/features/profiles/widgets/access_duration_info_tile.dart';
import 'package:nest_loop_mobile/features/profiles/widgets/care_access_info_tile.dart';
import 'package:nest_loop_mobile/features/profiles/widgets/parent_access_info_tile.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/response/get_child_care_provider_response.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/access_durations.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/access_levels.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/modals/app_platform_bottom_sheet.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class CareTeamInfoTile extends StatelessWidget {
  final ChildCareProviderResponse model;
  const CareTeamInfoTile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WidgetCasing(
          outerContent: SizedBox.shrink(),
          padding: EdgeInsets.fromLTRB(8.aw, 0, 8.aw, 8.ah),
          content: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.ar),
                        child: Image.asset(
                          AppAssets.profileImagePlaceholder,
                          height: 58.ah,
                          width: 58.aw,
                          fit: BoxFit.cover,
                        ),
                      ),
                      12.sbW,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 170.aw,
                                child: Text(
                                  model.parent?.fullName ?? model.careProvider?.fullName ?? '',
                                  style: AppTextStyles.h3Inter(context),
                                ),
                              ),
                              5.sbW,
                              Icon(
                                Icons.verified_sharp,
                                size: 18.ar,
                                color: AppColors.baseBlue,
                              ),
                            ],
                          ),
                          2.sbH,
                          Text(
                            model.parent?.email ?? model.careProvider?.email ?? '',
                            style: AppTextStyles.body2RegularInter(
                              context,
                            ).copyWith(color: AppColors.slateCharcoal60),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  if (model.parent != null) ...[
                    Container(
                      margin: EdgeInsets.only(right: 16.aw),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        vertical: 6.ah,
                        horizontal: 8.aw,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.ar),
                        color: AppColors.neutralWhite,
                        border: Border.all(
                          color: AppColors.highlightCTAOrange,
                          width: 1.aw,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            SvgAssets.securityIcon,
                            height: 14.ah,
                          ),
                          4.sbW,
                          Text(
                            AppStrings.parent,
                            style: AppTextStyles.body1RegularInter(context)
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.slateCharcoal80,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
              16.sbH,
              Builder(
                builder: (_) {
                  if (model.parent != null) {
                    return ParentAccessInfoTile();
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CareAccessInfoTile(accessLevel: model.accessType ?? AccessLevels.none),
                      10.sbH,
                      AccessDurationInfoTile(
                        accessDuration: model.accessDuration?.type ?? AccessDurations.none,
                        start: model.createdAt ?? DateTime.now(),
                        end: model.accessDuration?.expiryDateTime ?? DateTime.now(),
                      ),
                      10.sbH,
                      Row(
                        children: [
                          Container(
                            height: 48.ah,
                            width: 48.aw,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.baseBackground,
                            ),
                            child: Icon(
                              CupertinoIcons.delete,
                              size: 18.ar,
                              color: AppColors.baseRed,
                            ),
                          ),
                          8.sbW,
                          Expanded(
                            child: AppButton(
                              onTap: () =>
                                  AppPlatformBottomSheet.showAppBottomModalSheet(
                                    context: context,
                                    content: ManageCareAccessWidget(
                                      model: model,
                                    ),
                                  ),
                              title: AppStrings.manageAccess,
                              buttonColor: AppColors.baseBackground,
                              textColor: AppColors.slateCharcoalMain,
                              buttonIcon: Icon(
                                Icons.admin_panel_settings_outlined,
                                size: 24.ar,
                                color: AppColors.slateCharcoal40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        if (model.careProvider?.isParent ?? false) ...[
          16.sbH,
          Divider(thickness: 1.aw, color: AppColors.slateCharcoal06),
        ],
      ],
    );
  }
}
