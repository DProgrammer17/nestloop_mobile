import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/communities/state/interim_forum_model.dart';
import 'package:nest_loop_mobile/features/communities/widgets/discover/post_info_tile.dart';
import 'package:nest_loop_mobile/utils/extensions/int_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_network_image.dart';

class GroupInfoTile extends StatelessWidget {
  final GroupInfo groupModel;
  const GroupInfoTile({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.ah, horizontal: 8.aw),
      width: 181.aw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.ar),
        color: AppColors.slateCharcoal06,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.ah),
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.ar),
              color: AppColors.baseBackground,
            ),
            child: AppNetworkImage(
              image: groupModel.iconUrl,
              height: 52.ah,
              width: 52.aw,
              radius: 8.ar,
            ),
          ),
          16.sbH,
          Text(
            groupModel.name,
            style: AppTextStyles.h3Inter(context).copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.slateCharcoal80,
            ),
          ),
          4.sbH,
          PostInfoTile(
            icon: Icons.person,
            iconColor: AppColors.slateCharcoal60,
            info: AppStrings.trendingMembers(groupModel.membersCount.toKFormat()),
          ),
          16.sbH,
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.ah, horizontal: 8.aw),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: AppColors.baseBackground,
              borderRadius: BorderRadius.circular(40.ar),
            ),
            child: PostInfoTile(
              icon: Icons.chat_bubble,
              iconColor: AppColors.slateCharcoal60,
              info: AppStrings.trendingMembers(groupModel.newPostsCount.toKFormat()),
            ),
          ),
        ],
      ),
    );
  }
}
