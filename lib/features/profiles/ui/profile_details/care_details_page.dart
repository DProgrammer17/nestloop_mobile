import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/child_profile/model/child_profile_model.dart';
import 'package:nest_loop_mobile/utils/extensions/string_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/tiles/info_tile.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class CareDetailsPage extends StatelessWidget {
  final ChildProfileModel model;
  const CareDetailsPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (model.triggers.isNotBlank || model.allergies.isNotBlank) ...[
            WidgetCasing(
              outerContent: SizedBox.shrink(),
              padding: EdgeInsets.symmetric(vertical: 16.ah, horizontal: 16.aw),
              content: Column(
                children: [
                  if (model.triggers.isNotBlank) ...[
                    InfoTile(
                      headerIcon: SvgPicture.asset(
                        SvgAssets.triggersIcon,
                        height: 13.ah,
                        color: AppColors.slateCharcoal60,
                      ),
                      headerTitle: AppStrings.triggers,
                      info: model.triggers!,
                    ),
                  ],
                  if (model.allergies.isNotBlank) ...[
                    16.sbH,
                    InfoTile(
                      headerIcon: SvgPicture.asset(
                        SvgAssets.allergiesIcon,
                        height: 20.ah,
                        color: AppColors.slateCharcoal60,
                      ),
                      headerTitle: AppStrings.allergies,
                      info: model.allergies!,
                    ),
                  ],
                ],
              ),
            ),
          ],
          if (model.therapyGoals.isNotBlank || model.dailyRoutine.isNotBlank) ...[
            14.sbH,
            WidgetCasing(
              outerContent: SizedBox.shrink(),
              padding: EdgeInsets.symmetric(vertical: 16.ah, horizontal: 16.aw),
              content: Column(
                children: [
                  if (model.therapyGoals.isNotBlank) ...[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.sports_soccer_outlined,
                          size: 23.ar,
                          color: AppColors.slateCharcoalMain,
                        ),
                        8.sbW,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.therapyGoals,
                              style: AppTextStyles.h3Inter(context).copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.slateCharcoal80,
                              ),
                            ),
                            4.sbH,
                            Text(
                              model.therapyGoals!,
                              style: AppTextStyles.body2RegularInter(
                                context,
                              ).copyWith(color: AppColors.slateCharcoal60),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                  if (model.dailyRoutine.isNotBlank) ...[
                    14.sbH,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(SvgAssets.routineIcon, height: 22.ah),
                        8.sbW,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.dailyRoutine,
                              style: AppTextStyles.h3Inter(context).copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.slateCharcoal80,
                              ),
                            ),
                            4.sbH,
                            Padding(
                              padding: EdgeInsets.only(left: 4.aw),
                              child: Text(
                                model.dailyRoutine!
                                    .replaceAll(',', '')
                                    .replaceAll('\n', '\n⚈ ')
                                    .replaceAll(' ', '\n⚈ '),
                                style: AppTextStyles.body2RegularInter(
                                  context,
                                ).copyWith(color: AppColors.slateCharcoal60),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
          14.sbH,
          AppButton(
            width: double.infinity,
            onTap: () {},
            title: AppStrings.editCareDetails,
            textColor: AppColors.slateCharcoalMain,
            buttonColor: AppColors.neutralWhite,
            borderColor: AppColors.slateCharcoal06,
            borderWidth: 2.aw,
            prefixButtonIcon: Icon(
              Icons.mode_edit_outlined,
              size: 22.ar,
              color: AppColors.highlightCTAOrange,
            ),
          ),
          80.sbH,
        ],
      ),
    );
  }
}
