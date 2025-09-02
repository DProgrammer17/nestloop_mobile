import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/home/state/interim_community_activity_model.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_network_image.dart';

class CommunityPostInfoTile extends StatelessWidget {
  final Author author;
  const CommunityPostInfoTile({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.ah, horizontal: 8.aw),
      decoration: BoxDecoration(
        color: AppColors.baseBackground,
        borderRadius: BorderRadius.circular(16.ar),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppNetworkImage(
            image: author.avatarUrl,
            height: 34.ah,
            width: 34.aw,
            radius: 8.ar,
          ),
          8.sbW,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                author.name,
                style: AppTextStyles.body2RegularInter(context).copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.slateCharcoal80,
                ),
              ),
              2.sbH,
              Text(
                timeago.format(author.postTime),
                style: AppTextStyles.body1RegularInter(context).copyWith(
                  color: AppColors.slateCharcoal60,
                ),
              ),
            ],
          ),
          8.sbW,
        ],
      ),
    );
  }
}
