import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/communities/state/interim_post_model.dart';
import 'package:nest_loop_mobile/features/communities/widgets/reply_info_tile.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class ReplyHeaderWidget extends StatelessWidget {
  final ReplyPostModel post;
  const ReplyHeaderWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return WidgetCasing(
      padding: EdgeInsets.symmetric(vertical: 16.ah, horizontal: 16.aw),
      outerContent: Text(
        post.topic,
        style: AppTextStyles.h5Inter(
          context,
        ).copyWith(fontWeight: FontWeight.w700),
      ),
      outerContentPadding: 0,
      content: Text(
        post.post,
        style: AppTextStyles.body2RegularInter(
          context,
        ).copyWith(color: AppColors.slateCharcoal60),
      ),
      bottomContentSpacing: 16,
      bottomContent: ReplyInfoTile(post: post),
    );
  }
}
