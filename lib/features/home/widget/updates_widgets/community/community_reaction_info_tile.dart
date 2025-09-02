import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/home/state/interim_community_activity_model.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class CommunityReactionInfoTile extends StatelessWidget{
  final CommunityPost notification;
  const CommunityReactionInfoTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 34.ah,
              width: 34.aw,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.ar),
                color: AppColors.slateCharcoal06,
              ),
              child: Icon(
                CupertinoIcons.heart_fill,
                color: Colors.pink,
                size: 22.ar,
              ),
            ),
            8.sbW,
            Stack(
              children: List.generate(
                notification.reactions.length,
                    (index) => Positioned(
                  left: index > 0 ? 15.aw : 0,
                  child: Container(
                    height: 23.ah,
                    width: 23.aw,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.ar),
                      border: Border.all(
                        color: AppColors.baseBackground,
                        width: 2.aw,
                      ),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          notification.reactions.elementAt(index).avatarUrl,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              '${notification.reactions.first.sender} and ${notification.reactions.length > 1 ? (notification.reactions.length - 1) : ''}',
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
        ),
        2.sbH,
        Text(
          timeago.format(notification.time),
          style: AppTextStyles.body1RegularInter(context).copyWith(
            color: AppColors.slateCharcoal60,
          ),
        ),
      ],
    );
  }

}