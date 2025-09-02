import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/communities/state/interim_post_model.dart';
import 'package:nest_loop_mobile/features/home/widget/updates_widgets/community/community_post_info_tile.dart';
import 'package:nest_loop_mobile/features/home/widget/updates_widgets/community/reaction_display_tile.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class CommunityPostWidget extends StatelessWidget{
  final InterimPostModel post;
  final VoidCallback? onRepliesTap;
  const CommunityPostWidget({super.key, required this.post, this.onRepliesTap});

  @override
  Widget build(BuildContext context) {
    return WidgetCasing(
      padding: EdgeInsets.symmetric(vertical: 6.ah, horizontal: 5.aw),
      outerContentPadding: 0,
      outerContent: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommunityPostInfoTile(author: post.author),
          Container(
            height: 48.ah,
            width: 48.aw,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.ar),
              color: AppColors.baseBackground,
            ),
            child: Icon(
              Icons.more_vert,
              size: 22.ar,
              color: AppColors.slateCharcoalMain,
            ),
          ),
        ],
      ),
      content:   WidgetCasing(
        padding: EdgeInsets.symmetric(vertical: 16.ah, horizontal: 16.aw),
        contentSpacing: 0,
        outerContent: SizedBox.shrink(),
        backgroundColor: AppColors.baseBackground,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.topic,
              style: AppTextStyles.h5Inter(
                context,
              ).copyWith(fontWeight: FontWeight.w700),
            ),
            8.sbH,
            Text(
              post.content,
              style: AppTextStyles.body2RegularInter(
                context,
              ).copyWith(color: AppColors.slateCharcoal60),
            ),
            16.sbH,
            ReactionDisplayTile(reactions: post.reactions, useSecondaryColor: true,),
            if(post.replies.isNotEmpty)...[
              16.sbH,
              InkWell(
                onTap: onRepliesTap,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 30.ah,
                        maxHeight: 30.ah,
                        maxWidth: (post.replies.length * 30).aw,
                      ),
                      child: Stack(
                        children: List.generate(
                          post.replies.length > 4 ? 4 : post.replies.length,
                              (index) => Positioned(
                            left: index > 0 ? (index * 15).aw : 0,
                            child: Container(
                              height: 30.ah,
                              width: 30.aw,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.slateCharcoal80,
                                borderRadius: BorderRadius.circular(8.ar),
                                border: Border.all(
                                  color: AppColors.baseBackground,
                                  width: 2.aw,
                                ),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    post.replies.elementAt(index).url,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    8.sbW,
                    Text(
                      AppStrings.postReplies(post.replies.length.toString()),
                      style: AppTextStyles.body2RegularInter(context).copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),);
  }

}