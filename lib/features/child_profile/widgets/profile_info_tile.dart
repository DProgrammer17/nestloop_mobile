import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/child_profile/widgets/medical_info_tile.dart';
import 'package:nest_loop_mobile/network/api/user/response/get_user_profile_response.dart';
import 'package:nest_loop_mobile/utils/enums/medical_category.dart';
import 'package:nest_loop_mobile/utils/extensions/date_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/string_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_network_image.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class ProfileInfoTile extends StatelessWidget {
  final ChildData model;
  final bool showRemove;
  final VoidCallback? removeAction;
  final VoidCallback? detailsAction;
  const ProfileInfoTile({
    super.key,
    required this.model,
    this.showRemove = false,
    this.removeAction,
    this.detailsAction,
  });

  @override
  Widget build(BuildContext context) {
    return WidgetCasing(
      suffixOuterTitle: showRemove
          ? Padding(
              padding: EdgeInsets.only(right: 8.aw),
              child: InkWell(
                onTap: removeAction,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    CupertinoIcons.clear,
                    size: 22.ar,
                    color: AppColors.slateCharcoal80,
                  ),
                ),
              ),
            )
          : null,
      content: Column(
        children: [
          AppNetworkImage(image: model.avatar?.url ?? ''),
          16.sbH,
          Text(
            model.name ?? '',
            style: AppTextStyles.h1Inter(context).copyWith(fontSize: 18.asp),
          ),
          6.sbH,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    (model.gender ?? '').toLowerCase().contains(
                          AppStrings.male.toLowerCase(),
                        )
                        ? Icons.male_sharp
                        : Icons.female_sharp,
                    size: 14.ar,
                    color: AppColors.slateCharcoal60,
                  ),
                  5.sbW,
                  Text(
                    (model.gender ?? '').toUpperCase(),
                    style: AppTextStyles.body1RegularInter(
                      context,
                    ).copyWith(color: AppColors.slateCharcoal60),
                  ),
                ],
              ),
              8.sbW,
              SizedBox(
                height: 16.ah,
                child: VerticalDivider(
                  thickness: 1.2.ah,
                  color: AppColors.slateCharcoal60,
                ),
              ),
              8.sbW,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 14.ar,
                    color: AppColors.slateCharcoal60,
                  ),
                  5.sbW,
                  Text(
                    (model.dateOfBirth ?? DateTime.now()).fullDateMonthDayFormat
                        .toUpperCase(),
                    style: AppTextStyles.body1RegularInter(
                      context,
                    ).copyWith(color: AppColors.slateCharcoal60),
                  ),
                ],
              ),
            ],
          ),
          16.sbH,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MedicalInfoTile(
                category: MedicalCategory.diagnosis,
                info: (model.diagnoses ?? []).join(', ').toCamelCase,
              ),
              if (model.allergies != null && model.allergies!.isNotEmpty) ...[
                6.sbW,
                MedicalInfoTile(
                  category: MedicalCategory.allergies,
                  info: (model.allergies ?? []).join(', ').toCamelCase,
                ),
                3.sbW,
              ],
              if (model.triggers != null && model.triggers!.isNotEmpty) ...[
                3.sbW,
                MedicalInfoTile(
                  category: MedicalCategory.triggers,
                  info: (model.triggers ?? []).join(', ').toCamelCase,
                ),
                3.sbW,
              ],
            ],
          ),
          12.sbH,
          AppButton(
            width: double.infinity,
            onTap: detailsAction,
            title: AppStrings.seeDetails,
            textColor: AppColors.slateCharcoalMain,
            buttonColor: AppColors.neutralWhite,
            prefixButtonIcon: SvgPicture.asset(
              (model.gender ?? '').toLowerCase().contains(
                    AppStrings.male.toLowerCase(),
                  )
                  ? SvgAssets.boyChildIcon
                  : SvgAssets.boyChildIcon,
              height: 22.ar,
              color: AppColors.slateCharcoal60,
            ),
          ),
        ],
      ),
    );
  }
}
