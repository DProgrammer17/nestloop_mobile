import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/request/create_child_profile_request.dart';
import 'package:nest_loop_mobile/utils/extensions/date_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/small_info_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/tiles/time_pill.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class RoutineInfoTile extends StatelessWidget {
  final RoutineInfo info;
  const RoutineInfoTile({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return WidgetCasing(
      borderRadius: 16.ar,
      backgroundColor: AppColors.baseBackground,
      padding: EdgeInsets.fromLTRB(16.aw, 8.ah, 16.aw, 16.ah),
      outerContent: const SizedBox.shrink(),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TimePill(time: info.time),
          12.sbH,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 8.ah,
                width: 8.aw,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondaryPop,
                ),
              ),
              8.sbW,
              Text(
                info.routine,
                style: AppTextStyles.body4RegularInter(
                  context,
                ).copyWith(color: AppColors.slateCharcoal80),
              ),
            ],
          ),
          16.sbH,
          Divider(thickness: 1.aw, color: AppColors.slateCharcoal06),
          16.sbH,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmallInfoButton(
                leading: Icon(
                  Icons.person_add_alt_1_outlined,
                  size: 22.ar,
                  color: AppColors.slateCharcoal80,
                ),
                title: AppStrings.assign,
                onTap: () {},
              ),
              12.sbW,
              SmallInfoButton(
                leading: Icon(
                  Icons.sync,
                  size: 22.ar,
                  color: AppColors.slateCharcoal80,
                ),
                title: AppStrings.repeat,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
