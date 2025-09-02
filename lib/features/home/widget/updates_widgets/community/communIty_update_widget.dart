import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nest_loop_mobile/features/home/widget/updates_widgets/community/community_forum_tile.dart';
import 'package:nest_loop_mobile/features/home/widget/updates_widgets/community/community_post_info_tile.dart';
import 'package:nest_loop_mobile/features/home/widget/updates_widgets/community/community_reaction_info_tile.dart';
import 'package:nest_loop_mobile/features/home/widget/updates_widgets/community/reaction_display_tile.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/home/state/interim_community_activity_model.dart';
import 'package:nest_loop_mobile/utils/extensions/date_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/tiles/time_pill.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class CommunityUpdateWidget extends StatelessWidget {
  final CommunityPost notification;
  const CommunityUpdateWidget({super.key, required this.notification});

  Widget infoHeader(BuildContext context) {
    switch (notification.type) {
      case 'POST':
        return Row(
          children: [
            Text(
              AppStrings.postInfoText(forum: notification.forum.name),
              style: AppTextStyles.body2RegularInter(
                context,
              ).copyWith(color: AppColors.slateCharcoal80),
            ),
            2.sbW,
            Text(
              '\'${notification.topic}\'',
              style: AppTextStyles.body2RegularInter(context).copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.slateCharcoal80,
              ),
            ),
          ],
        );

      case 'REPLY':
        return Row(
          children: [
            Text(
              notification.author.name,
              style: AppTextStyles.body2RegularInter(context).copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.slateCharcoal80,
              ),
            ),
            2.sbW,
            Text(
              AppStrings.replyInfoText(forum: notification.forum.name),
              style: AppTextStyles.body2RegularInter(
                context,
              ).copyWith(color: AppColors.slateCharcoal80),
            ),
          ],
        );

      case 'REACTION':
        return CommunityReactionInfoTile(notification: notification);

      default:
        return SizedBox.shrink();
    }
  }

  String viewString() {
    switch (notification.type) {
      case 'POST':
        return AppStrings.viewPost;

      case 'REPLY':
      case 'COMMENT':
        return AppStrings.viewComment;

      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return WidgetCasing(
      borderRadius: 18.ar,
      backgroundColor: AppColors.baseBackground,
      padding: EdgeInsets.symmetric(vertical: 16.ah, horizontal: 16.aw),
      outerContentPadding: 0,
      outerContent: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (notification.read) ...[
            Container(
              height: 7.ah,
              width: 7.aw,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.highlightCTARed,
              ),
            ),
            6.sbW,
          ],
          TimePill(
            showIcon: true,
            time: notification.time.toHuman12HourFormat(),
          ),
        ],
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          infoHeader(context),
          if (notification.type != 'REACTION') ...[
            12.sbH,
            WidgetCasing(
              padding: EdgeInsets.symmetric(vertical: 12.ah, horizontal: 12.aw),
              contentSpacing: 0,
              outerContent: SizedBox.shrink(),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (notification.type == 'POST') ...[
                    CommunityPostInfoTile(author: notification.author),
                    16.sbH,
                  ],
                  Text(
                    notification.content.text,
                    style: AppTextStyles.body2RegularInter(
                      context,
                    ).copyWith(color: AppColors.slateCharcoal60),
                  ),
                  if (notification.type == 'POST') ...[
                    16.sbH,
                    ReactionDisplayTile(reactions: notification.reactions),
                  ],
                ],
              ),
            ),
            16.sbH,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommunityForumTile(notification: notification),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      viewString(),
                      style: AppTextStyles.body2RegularInter(context).copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    5.sbW,
                    Icon(
                      Symbols.chevron_forward,
                      size: 12.ar,
                      color: AppColors.primaryOrange,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
