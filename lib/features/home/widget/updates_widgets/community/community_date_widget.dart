import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/home/state/home_notifier.dart';
import 'package:nest_loop_mobile/features/home/state/interim_community_activity_model.dart';
import 'package:nest_loop_mobile/features/home/widget/updates_widgets/community/communIty_update_widget.dart';
import 'package:nest_loop_mobile/utils/extensions/date_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class CommunityDateWidget extends ConsumerWidget {
  final CommunityPostNotification notification;
  const CommunityDateWidget({super.key, required this.notification});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          notification.time.toHuman12HourFormat().split(',').first,
          style: AppTextStyles.body2RegularInter(context).copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.slateCharcoal60,
          ),
        ),
        12.sbH,
        WidgetCasing(
          padding: EdgeInsets.symmetric(vertical: 6.ah, horizontal: 6.aw),
          contentSpacing: 0,
          outerContent: SizedBox.shrink(),
          content: Column(
            spacing: 8.ah,
            children: List.generate(
              notification.posts.length,
                  (index) => CommunityUpdateWidget(
                notification: notification.posts.elementAt(index),
              ),
            ),
          ),
        ),
        24.sbH,
      ],
    );
  }
}
