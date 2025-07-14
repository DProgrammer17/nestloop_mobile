import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/access_durations.dart';
import 'package:nest_loop_mobile/utils/extensions/date_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/utils/helper_utils.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/tiles/info_tile.dart';

class AccessDurationInfoTile extends StatelessWidget {
  final AccessDurations accessDuration;
  final DateTime start;
  final DateTime end;
  const AccessDurationInfoTile({
    super.key,
    required this.accessDuration,
    required this.start,
    required this.end,
  });

  String durationStatus() {
    switch (accessDuration) {
      case AccessDurations.permanent:
        return AppStrings.permanent;

      case AccessDurations.ongoing:
        return AppStrings.ongoing;

      case AccessDurations.expiry:
        return AppStrings.temporary;

      case AccessDurations.none:
        return AppStrings.permanent;
    }
  }

  Widget durationIcon() {
    switch (accessDuration) {
      case AccessDurations.permanent:
        return Icon(
          Icons.event_available_sharp,
          size: 24.ar,
          color: AppColors.slateCharcoal80,
        );

      case AccessDurations.ongoing:
        return Icon(
          Icons.calendar_month,
          size: 24.ar,
          color: AppColors.slateCharcoal80,
        );

      case AccessDurations.expiry:
        return Icon(
          Icons.all_inclusive_outlined,
          size: 20.ar,
          color: AppColors.slateCharcoal80,
        );

      case AccessDurations.none:
        return Icon(
          Icons.event_available_sharp,
          size: 24.ar,
          color: AppColors.slateCharcoal80,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.ah, horizontal: 14.aw),
      decoration: BoxDecoration(
        color: AppColors.baseBackground,
        borderRadius: BorderRadius.circular(16.ar),
      ),
      child: Column(
        children: [
          InfoTile(
            headerIcon: durationIcon(),
            headerTitle: AppStrings.accessDuration,
            info: durationStatus(),
          ),
          if (accessDuration == AccessDurations.expiry) ...[
            15.sbH,
            LinearProgressIndicator(
              value:
                  HelperUtils.daysBetween(DateTime.now(), end) /
                  HelperUtils.daysBetween(start, end),
              minHeight: 5.ah,
              borderRadius: BorderRadius.circular(30.ar),
              backgroundColor: AppColors.softSupportAccent2,
              color: AppColors.highlightCTAOrange,
            ),
            12.sbH,
            InfoTile(
              headerContent: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.started,
                    style: AppTextStyles.body1RegularInter(context).copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  4.sbH,
                  Text(
                    start.fullDateMonthDayFormat,
                    style: AppTextStyles.body1RegularInter(context).copyWith(
                      color: AppColors.slateCharcoal60,
                    ),
                  ),
                ],
              ),
              infoContent: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    AppStrings.ends,
                    textAlign: TextAlign.end,
                    style: AppTextStyles.body1RegularInter(context).copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  4.sbH,
                  Text(
                    end.fullDateMonthDayFormat,
                    textAlign: TextAlign.end,
                    style: AppTextStyles.body1RegularInter(context).copyWith(
                      color: AppColors.slateCharcoal60,
                    ),
                  ),
                ],
              ),
              info: durationStatus(),
            ),
          ],
        ],
      ),
    );
  }
}
