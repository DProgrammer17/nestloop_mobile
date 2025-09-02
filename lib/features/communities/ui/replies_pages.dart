import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/features/communities/state/interim_post_model.dart';
import 'package:nest_loop_mobile/features/communities/widgets/community_post_widget.dart';
import 'package:nest_loop_mobile/features/communities/widgets/reply_header_widget.dart';
import 'package:nest_loop_mobile/features/communities/widgets/write_reply_widget.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/empty_appbar.dart';

class RepliesPage extends StatelessWidget {
  final ReplyPostModel post;
  const RepliesPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      padding: EdgeInsets.zero,
      appBar: EmptyAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReplyHeaderWidget(post: post),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.sbW,
              Container(
                width: 2.aw,
                height: AppConstants.deviceHeight * 0.7,
                color: AppColors.slateCharcoal06,
              ),
              16.sbW,
              Padding(
                padding: EdgeInsets.only(top: 24.ah),
                child: SizedBox(
                 height: AppConstants.deviceHeight * 0.68,
                  width: AppConstants.deviceWidth * 0.856,
                  child: ListView.builder(
                    itemCount: post.replyPosts.length,
                    itemBuilder: (_, index) =>
                        Padding(
                          padding: EdgeInsets.only(bottom: index == (post.replyPosts.length - 1) ? 140.ah : 16.ah),
                          child: CommunityPostWidget(post: post.replyPosts.elementAt(index)),
                        ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomPadding: EdgeInsets.zero,
      bottomBackgroundColor: AppColors.neutralWhite,
      bottomSheet: WriteReplyWidget(),
    );
  }
}
