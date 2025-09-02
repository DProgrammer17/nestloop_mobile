import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/features/communities/state/interim_post_model.dart';
import 'package:nest_loop_mobile/features/communities/widgets/discover/post_info_tile.dart';
import 'package:nest_loop_mobile/utils/extensions/int_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:timeago/timeago.dart' as timeago;

class ReplyInfoTile extends StatelessWidget{
  final ReplyPostModel post;
  const ReplyInfoTile({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding:  EdgeInsets.symmetric(vertical: 10.ah, horizontal: 10.aw),
      decoration: BoxDecoration(
        color: AppColors.baseBackground,
        borderRadius: BorderRadius.circular(50.ar),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          PostInfoTile(
            icon: Icons.chat_bubble,
            iconColor: AppColors.slateCharcoal60,
            info: AppStrings.postReplies(post.replyPosts.length.toKFormat()),
          ),
          16.sbW,
          PostInfoTile(
            icon: Icons.visibility,
            iconColor: AppColors.slateCharcoal60,
            info: AppStrings.postViews(post.views.toKFormat()),
          ),
          16.sbW,
          PostInfoTile(
            icon: Icons.schedule,
            iconColor: AppColors.slateCharcoal60,
            info: AppStrings.postLastReply(timeago.format(post.replyPosts.last.author.postTime)),
          ),
        ],
      ),
    );
  }

}