import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/communities/state/communities_notifier.dart';
import 'package:nest_loop_mobile/features/communities/state/interim_forum_model.dart';
import 'package:nest_loop_mobile/features/communities/widgets/community_post_widget.dart';
import 'package:nest_loop_mobile/features/communities/widgets/discover/post_info_tile.dart';
import 'package:nest_loop_mobile/features/home/state/home_notifier.dart';
import 'package:nest_loop_mobile/utils/extensions/int_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/floating_button_scaffold.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_network_image.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_back_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';

class DiscoverGroupDetailsPage extends ConsumerWidget {
  final GroupInfo info;
  const DiscoverGroupDetailsPage({super.key, required this.info});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      padding: EdgeInsets.zero,
      appBackgroundColor: AppColors.neutralWhite,
      centerTile: true,
      toolbarHeight: AppConstants.deviceHeight * 0.26,
      appBarContent: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBackButton(size: 28.ar),
              Text(
                info.name,
                style: AppTextStyles.h4Satoshi(
                  context,
                ).copyWith(fontWeight: FontWeight.w700),
              ),
              Icon(
                Symbols.more_vert,
                size: 28.ar,
                color: AppColors.slateCharcoalMain,
              ),
            ],
          ),
          20.sbH,
          AppNetworkImage(
            image: info.iconUrl,
            height: 52.ah,
            width: 52.aw,
            radius: 10.ar,
          ),
          16.sbH,
          Flexible(
            flex: 0,
            child: SizedBox(
              width: AppConstants.deviceWidth - 50.aw,
              child: Text(
                info.description,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                softWrap: true,
                style: AppTextStyles.body2RegularInter(
                  context,
                ).copyWith(height: 1.4.ah, color: AppColors.slateCharcoal80),
              ),
            ),
          ),
          16.sbH,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PostInfoTile(
                icon: Icons.person,
                iconColor: AppColors.slateCharcoal60,
                info: AppStrings.trendingMembers(info.membersCount.toKFormat()),
              ),
              16.sbW,
              PostInfoTile(
                icon: Icons.chat_bubble,
                iconColor: AppColors.slateCharcoal60,
                info: AppStrings.trendingPostCount(
                  info.newPostsCount.toKFormat(),
                ),
              ),
            ],
          ),
        ],
      ),
      body: FloatingWidgetScaffold(
        floatingWidget: AppButton(
          onTap: () {},
          title: AppStrings.post,
          prefixButtonIcon: Icon(
            CupertinoIcons.plus,
            size: 22.ar,
            color: AppColors.neutralWhite,
          ),
          borderColor: AppColors.neutralWhite,
          borderWidth: 4.aw,
        ),
        pageContent: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.ah, horizontal: 16.aw),
            child: Column(
              spacing: 16.ah,
              children: List.generate(
                ref.watch(communitiesNotifier).posts.length,
                (index) => CommunityPostWidget(
                  onRepliesTap: () => ref
                      .watch(communitiesNotifier.notifier)
                      .showRepliesModal(
                        context: context,
                        postId: ref
                            .watch(communitiesNotifier)
                            .posts
                            .elementAt(index)
                            .id,
                      ),
                  post: ref.watch(communitiesNotifier).posts.elementAt(index),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
